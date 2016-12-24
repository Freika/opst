class Season < ApplicationRecord
  include Calculateable

  has_many :matches, dependent: :destroy

  def maps_statistics(user_id)
    hash = {}

    Map.all.each do |m|
      map_matches =
        matches
          .joins(:map)
          .where('maps.id = ? and user_id = ?', m.id, user_id)
          .count
      map_name = m.name.underscore.gsub(/\s|'|:/, '_')

      hash[map_name] = to_percent(map_matches, total(user_id))
    end

    hash
  end

  def wins_percentage_per_map(user_id)
    hash = {}

    Map.all.each do |m|
      map_wins =
        matches
          .joins(:map)
          .where(
            'maps.id = ? and result = ? and user_id = ?',
              m.id, Match.results[:win], user_id
          )
          .count
      map_name = m.name.underscore.gsub(/\s|'|:/, '_')

      hash[map_name] = to_percent(map_wins, total(user_id))
    end

    hash
  end

  def wins_percentage_per_hero(user_id)
    hash = {}

    Hero.all.each do |h|
      hero_wins =
        matches
        .joins(:heros)
        .where(
          'heros.id = ? and result = ? and user_id = ?',
            h.id, Match.results[:win], user_id)
        .count
      hero_name = h.name.underscore.gsub(' ', '_').gsub('.', '')

      hash[hero_name] = to_percent(hero_wins, total(user_id))
    end

    hash
  end

  def heroes_statistics(user_id)
    hash = {}

    Hero.all.each do |h|
      hero_matches =
        matches
          .joins(:heros)
          .where('heros.id = ? and user_id = ?', h.id, user_id)
          .count
      hero_name = h.name.underscore.gsub(' ', '_').gsub('.', '')

      hash[hero_name] = to_percent(hero_matches, total(user_id))
    end

    hash
  end

  def streaks(user_id)
    matches.where(user_id: user_id).pluck(:streak)
  end

  private

  def total(user_id)
    matches.where(user_id: user_id).count
  end
end
