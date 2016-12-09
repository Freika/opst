class Season < ApplicationRecord
  include Calculateable

  has_many :matches

  def results_statistics
    total = matches.count
    wins  = matches.where(result: Match.results[:win]).count
    loses = matches.where(result: Match.results[:lose]).count
    draws = matches.where(result: Match.results[:draw]).count

    win_percent = to_percent(wins, total)
    lose_percent = to_percent(loses, total)
    draw_percent = to_percent(draws, total)

    { wins: win_percent, loses: lose_percent, draws: draw_percent }
  end
end
