class Season < ApplicationRecord
  include Calculateable

  has_many :matches

  def results_statistics
    wins  = matches.where(result: Match.results[:win]).count
    losses = matches.where(result: Match.results[:lose]).count
    draws = matches.where(result: Match.results[:draw]).count

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

  def heroes_statistics
    hash = {}

    Hero.all.each do |h|
      hero_matches = matches.joins(:heros).where('heros.id = ?', h.id).count
      hero_name = h.name.underscore.gsub(' ', '_').gsub('.', '')

      hash[hero_name] = to_percent(hero_matches, total)
    end

    hash
  end

  private

  def total
    matches.count
  end
end
