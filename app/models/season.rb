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

  private

  def total
    matches.count
  end
end
