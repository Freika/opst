class StatisticsController < ApplicationController
  before_action :authenticate_user!

  def main
    @matches = current_user.matches
                .current_season
                .includes(:map)
                .order(created_at: :asc)
    @season = Season.last

    # Season main statistics
    wins = @matches.win.count
    losses = @matches.lose.count
    draws = @matches.draw.count
    games_played = @matches.count

    @main_stats = {
      games_played: games_played,
      wins: wins,
      losses: losses,
      draws: draws,
      win_percent: @season.to_percent(wins, games_played),
      lose_percent: @season.to_percent(losses, games_played),
      draw_percent: @season.to_percent(draws, games_played),
      # TODO: implement
      longest_win_streak: 'N/A',
      longest_loss_streak: 'N/A',
      average_gain: 'N/A',
      average_loss: 'N/A'
    }

    @skill_rating_chart = @matches.pluck(:skill_rating)
    @streaks = @season.streaks(current_user.id)
  end

  def heroes
    @matches = current_user.matches
                .current_season
                .includes(:map)
                .order(created_at: :asc)
    @season = Season.last

    @heroes = Hero.all
    @heroes_statistics = @season.heroes_statistics
    @heroes_wins = @season.wins_percentage_per_hero
  end

  def maps
    @matches = current_user.matches
                .current_season
                .includes(:map)
                .order(created_at: :asc)
    @season = Season.last
    @maps = Map.all

    @maps_statistics = @season.maps_statistics
    @wins_per_map = @season.wins_percentage_per_map

    games_played = @matches.count
    assault_matches = @matches.joins(:map).merge(Map.where(kind: Map.kinds[:assault]))
    escort_matches = @matches.joins(:map).merge(Map.where(kind: Map.kinds[:escort]))
    hybrid_matches = @matches.joins(:map).merge(Map.where(kind: Map.kinds[:hybrid]))
    control_matches = @matches.joins(:map).merge(Map.where(kind: Map.kinds[:control]))

    @played = {
      assault: assault_matches.count,
      escort: escort_matches.count,
      hybrid: hybrid_matches.count,
      control: control_matches.count
    }

    @played_percent = {
      hybrid: @season.to_percent(@played[:hybrid], games_played),
      escort: @season.to_percent(@played[:escort], games_played),
      assault: @season.to_percent(@played[:assault], games_played),
      control: @season.to_percent(@played[:control], games_played)
    }


    hybrid_wins = hybrid_matches.where(result: Match.results[:win]).count
    hybrid_losses = hybrid_matches.where(result: Match.results[:lose]).count
    hybrid_draws = hybrid_matches.where(result: Match.results[:draw]).count
    @hybrid = {
      wins: hybrid_wins,
      losses: hybrid_losses,
      draws: hybrid_draws,
      wins_percent: @season.to_percent(hybrid_wins, games_played),
      losses_percent: @season.to_percent(hybrid_losses, games_played),
      draws_percent: @season.to_percent(hybrid_draws, games_played)
    }

    escort_wins = escort_matches.where(result: Match.results[:win]).count
    escort_losses = escort_matches.where(result: Match.results[:lose]).count
    escort_draws = escort_matches.where(result: Match.results[:draw]).count
    @escort = {
      wins: escort_wins,
      losses: escort_losses,
      draws: escort_draws,
      wins_percent: @season.to_percent(escort_wins, games_played),
      losses_percent: @season.to_percent(escort_losses, games_played),
      draws_percent: @season.to_percent(escort_draws, games_played)
    }

    assault_wins = assault_matches.where(result: Match.results[:win]).count
    assault_losses = assault_matches.where(result: Match.results[:lose]).count
    assault_draws = assault_matches.where(result: Match.results[:draw]).count
    @assault = {
      wins: assault_wins,
      losses: assault_losses,
      draws: assault_draws,
      wins_percent: @season.to_percent(assault_wins, games_played),
      losses_percent: @season.to_percent(assault_losses, games_played),
      draws_percent: @season.to_percent(assault_draws, games_played)
    }


    control_wins = control_matches.where(result: Match.results[:win]).count
    control_losses = control_matches.where(result: Match.results[:lose]).count
    control_draws = control_matches.where(result: Match.results[:draw]).count
    @control = {
      wins: control_wins,
      losses: control_losses,
      draws: control_draws,
      wins_percent: @season.to_percent(control_wins, games_played),
      losses_percent: @season.to_percent(control_losses, games_played),
      draws_percent: @season.to_percent(control_draws, games_played)
    }
  end
end
