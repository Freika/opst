# == Schema Information
#
# Table name: seasons
#
#  id          :integer          not null, primary key
#  name        :string
#  finishes_at :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Season < ApplicationRecord
  include Calculateable
  END_OF_SEASON = DateTime.new(2017, 8, 29).freeze

  has_many :matches, dependent: :destroy
  has_many :qualifications

  after_create :create_qualifications

  def self.current
    last
  end

  def maps_statistics(matches, user_id)
    hash = {}

    Map.find_each do |map|
      map_matches = matches.joins(:map).where('maps.id = ?', map.id).size
      map_name = map.underscore_name
      hash[map_name] = to_percent(map_matches, total(user_id))
    end

    hash
  end

  Match.results.keys.each do |result|
    define_method("heroes_#{result.pluralize}") do |user_id|
      Hero.order(name: :asc).map do |hero|
        hero.matches.where(result: result, user_id: user_id, season: self).size
      end
    end
  end

  def wins_percentage_per_map(matches, user_id)
    hash = {}

    Map.find_each do |map|
      map_wins =
        matches
          .joins(:map)
          .where('maps.id = ? and result = ?', map.id, Match.results[:win])
          .size
      map_name = map.underscore_name

      hash[map_name] = to_percent(map_wins, total(user_id))
    end

    hash
  end

  def wins_percentage_per_hero(matches, user_id)
    hash = {}

    Hero.find_each do |hero|
      hero_wins =
        matches.joins(:heros)
        .where('heros.id = ? and result = ?', hero.id, Match.results[:win])
        .size
      hero_name = hero.name.underscore.gsub(' ', '_').gsub('.', '')

      hash[hero_name] = to_percent(hero_wins, total(user_id))
    end

    hash
  end

  def streaks(user_id)
    matches.where(user_id: user_id).pluck(:streak)
  end

  private

  def total(user_id)
    matches.where(user_id: user_id).size
  end

  def create_qualifications
    User.find_each do |user|
      user.qualifications.create(season: self)
    end
  end
end
