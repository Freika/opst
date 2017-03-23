class Season < ApplicationRecord
  include Calculateable

  has_many :matches, dependent: :destroy
  has_many :qualifications

  after_create :create_qualifications

  def self.current
    last
  end

  def maps_statistics(matches, user_id)
    hash = {}

    Map.all.each do |map|
      map_matches = matches.joins(:map).where('maps.id = ?', map.id).size

      map_name = map.name.underscore.gsub(/\s|'|:/, '_')

      hash[map_name] = to_percent(map_matches, total(user_id))
    end

    hash
  end

  def heroes_wins(user_id)
    Hero.all.order(name: :asc).map do|hero|
      hero.matches.where(result: 'win', user_id: user_id, season: self).size
    end
  end

  def heroes_losses(user_id)
    Hero.all.order(name: :asc).map do|hero|
      hero.matches.where(result: 'lose', user_id: user_id, season: self).size
    end
  end

  def heroes_draws(user_id)
    Hero.all.order(name: :asc).map do|hero|
      hero.matches.where(result: 'draw', user_id: user_id, season: self).size
    end
  end

  def wins_percentage_per_map(matches, user_id)
    hash = {}

    Map.all.each do |m|
      map_wins =
        matches
          .joins(:map)
          .where('maps.id = ? and result = ?', m.id, Match.results[:win])
          .size
      map_name = m.name.underscore.gsub(/\s|'|:/, '_')

      hash[map_name] = to_percent(map_wins, total(user_id))
    end

    hash
  end

  def wins_percentage_per_hero(matches, user_id)
    hash = {}

    Hero.all.each do |h|
      hero_wins =
        matches
        .joins(:heros)
        .where('heros.id = ? and result = ?', h.id, Match.results[:win])
        .size
      hero_name = h.name.underscore.gsub(' ', '_').gsub('.', '')

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
    User.all.each do |user|
      user.qualifications.create(season: self)
    end
  end
end
