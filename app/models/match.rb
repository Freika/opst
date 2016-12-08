class Match < ApplicationRecord
  has_one :destination
  has_one :map, through: :destination

  has_many :chosen_heros
  has_many :heros, through: :chosen_heros

  belongs_to :season
  enum result: { draw: 0, lose: 1, win: 2 }

  def update_skill_rating_diff
    prev_skill_rating = self.prev.try(:skill_rating) || self.skill_rating
    self.sr_diff = self.skill_rating - prev_skill_rating

    self
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

  def prev
    Match.where('id < ?', id).last
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
    prev_streak = self.prev.try(:streak)

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
      when 'lose' # correct
        self.streak = prev_streak - 1
      when 'draw'
        self.streak = prev_streak
      end
    end

    self
  end
end
