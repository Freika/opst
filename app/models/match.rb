# == Schema Information
#
# Table name: matches
#
#  id           :integer          not null, primary key
#  result       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  skill_rating :integer
#  sr_diff      :integer          default(0), not null
#  season_id    :integer          default(0), not null
#  streak       :integer          default(1), not null
#  user_id      :integer          default(0), not null
#  number       :integer          default(1), not null
#  comment      :text             default(""), not null
#  rounds       :integer
#  party_size   :integer
#

class Match < ApplicationRecord
  has_one :destination, dependent: :destroy
  has_one :map, through: :destination

  has_many :chosen_heros, dependent: :destroy
  has_many :heros, through: :chosen_heros

  belongs_to :season
  belongs_to :user
  enum result: { draw: 0, lose: 1, win: 2 }

  validates :rounds, numericality: {
    less_than: 7, only_integer: true, allow_nil: true
  }
  validates :party_size, numericality: {
    more_than_or_equal_to: 1,
    less_than_or_equal_to: 6,
    only_integer: true,
    allow_nil: true
  }
  validates :skill_rating, numericality: {
    less_than_or_equal_to: 5000, only_integer: true, greater_than_or_equal_to: 0
  }

  validates :skill_rating, presence: true

  scope :current_season, -> { where('season_id = ?', Season.last.id) }

  def update_skill_rating_diff
    matches = self.user.matches.current_season

    if matches.none? || matches.first == self
      prev_skill_rating = self.user.qualifications.last.skill_rating
    else
      prev_skill_rating = self.prev(self.user_id).try(:skill_rating)
    end

    self.sr_diff = self.skill_rating.to_i - prev_skill_rating.to_i
    self
  end

  def self.seasons(user)
    @season ||= Season.find(user.matches.pluck(:season_id).uniq)
  end

  def calculate_result
    self.result =
      if sr_diff.negative?
        Match.results[:lose]
      elsif sr_diff.positive?
        Match.results[:win]
      else
        Match.results[:draw]
      end

    self
  end

  def prev(user_id)
    Match.where('id < ? and user_id = ?', id, user_id).last
  end

  def next
    Match.where('id > ?', id).first
  end

  def update_associations(hero_ids, map_id)
    heroes = Hero.find(hero_ids.reject(&:empty?).map(&:to_i))
    heroes = heroes - self.heros
    self.heros << heroes
    self.map = Map.find(map_id)
    self.season = Season.last

    self
  end

  def update_streak
    prev_streak = self.prev(self.user_id).try(:streak)

    if prev_streak.try(:positive?)
      case self.result
      when 'win'
        self.streak = prev_streak + 1
      when 'lose'
        self.streak = -1
      when 'draw'
        self.streak = prev_streak
      end
    elsif prev_streak.try(:negative?)
      case self.result
      when 'win'
        self.streak = 1
      when 'lose'
        self.streak = prev_streak - 1
      when 'draw'
        self.streak = prev_streak
      end
    end

    self
  end

  def self.period_count_array
    from = 7.days.ago.beginning_of_day
    to = Date.today.end_of_day

    where(created_at: from..to).group('date(created_at)').count
  end

  def self.to_csv
    attributes = %w[
      id
      result
      skill_rating
      sr_diff
      season_id
      streak
      comment
      rounds
      party_size
      map_name
      heroes_names
    ]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |match|
        csv << attributes.map{ |attr| match.send(attr) }
      end
    end
  end

  def map_name
    map.name
  end

  def heroes_names
    heros.pluck(:name).join(', ')
  end
end
