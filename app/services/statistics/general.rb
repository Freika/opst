class Statistics::General
  attr_reader :data, :skill_rating_chart, :streaks

  def initialize(matches, season, user)
    @matches = matches
    @season = season
    @user = user
  end

  def data
    wins = @matches.win.size
    losses = @matches.lose.size
    draws = @matches.draw.size
    games_played = @matches.size

    main_stats = {
      games_played: games_played,
      wins: wins,
      losses: losses,
      draws: draws,
      win_percent: @season.to_percent(wins, games_played),
      lose_percent: @season.to_percent(losses, games_played),
      draw_percent: @season.to_percent(draws, games_played),
      longest_win_streak: @matches.maximum(:streak),
      longest_loss_streak: @matches.minimum(:streak),
      qualified: @user.qualifications.last.skill_rating,
      maximum: @matches.maximum(:skill_rating)
    }
  end

  def skill_rating_chart
    @matches.pluck(:skill_rating)
  end

  def streaks
    @season.streaks(@user.id)
  end
end
