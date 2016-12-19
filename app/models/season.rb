class Season < ApplicationRecord
  include Calculateable

  has_many :matches

  def results_statistics(user_id)
    wins  = matches.where(user_id: user_id, result: Match.results[:win]).count
    losses = matches.where(user_id: user_id, result: Match.results[:lose]).count
    draws = matches.where(user_id: user_id, result: Match.results[:draw]).count

    win_percent = to_percent(wins, total)
    lose_percent = to_percent(losses, total)
    draw_percent = to_percent(draws, total)

    { wins: win_percent, losses: lose_percent, draws: draw_percent }
  end

  def maps_statistics
    h = {}

    Map.all.each do |m|
      map_matches = matches.joins(:map).where('maps.id = ?', m.id).count
      map_name = m.name.underscore.gsub(/\s|'|:/, '_')

      h[map_name] = to_percent(map_matches, total)
    end

    h
  end

  def wins_percentage_per_map
    h = {}

    Map.all.each do |m|
      map_wins =
        matches
          .joins(:map)
          .where('maps.id = ? and result = ?', m.id, Match.results[:win])
          .count
      map_name = m.name.underscore.gsub(/\s|'|:/, '_')

      h[map_name] = to_percent(map_wins, total)
    end

    h
  end

  def wins_percentage_per_hero
    hash = {}

    Hero.all.each do |h|
      hero_wins =
        matches
        .joins(:heros)
        .where('heros.id = ? and result = ?', h.id, Match.results[:win])
        .count
      hero_name = h.name.underscore.gsub(' ', '_').gsub('.', '')

      hash[hero_name] = to_percent(hero_wins, total)
    end

    hash
  end

  def heroes_statistics
    hash = {}

    Hero.all.each do |h|
      hero_matches = matches.joins(:heros).where('heros.id = ?', h.id).count
      hero_name = h.name.underscore.gsub(' ', '_').gsub('.', '')

      hash[hero_name] = to_percent(hero_matches, total)
    end

    hash
  end

  def streaks(user_id)
    matches.where(user_id: user_id).pluck(:streak)
  end

  private

  def total
    matches.count
  end
end
