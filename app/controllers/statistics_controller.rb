class StatisticsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vars

  def main
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
    @heroes = Hero.all
    @heroes_statistics = {
      wins: @season.heroes_wins(current_user.id),
      losses: @season.heroes_losses(current_user.id),
      draws: @season.heroes_draws(current_user.id)
    }
    @heroes_wins = @season.wins_percentage_per_hero(@matches, current_user.id)
  end

  def maps
    @maps = Map.all

    @maps_statistics = @season.maps_statistics(@matches, current_user.id)
    @wins_per_map = @season.wins_percentage_per_map(@matches, current_user.id)

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
      wins_percent: @season.to_percent(hybrid_wins, @played[:hybrid]),
      losses_percent: @season.to_percent(hybrid_losses, @played[:hybrid]),
      draws_percent: @season.to_percent(hybrid_draws, @played[:hybrid])
    }

    escort_wins = escort_matches.where(result: Match.results[:win]).count
    escort_losses = escort_matches.where(result: Match.results[:lose]).count
    escort_draws = escort_matches.where(result: Match.results[:draw]).count
    @escort = {
      wins: escort_wins,
      losses: escort_losses,
      draws: escort_draws,
      wins_percent: @season.to_percent(escort_wins, @played[:escort]),
      losses_percent: @season.to_percent(escort_losses, @played[:escort]),
      draws_percent: @season.to_percent(escort_draws, @played[:escort])
    }

    assault_wins = assault_matches.where(result: Match.results[:win]).count
    assault_losses = assault_matches.where(result: Match.results[:lose]).count
    assault_draws = assault_matches.where(result: Match.results[:draw]).count
    @assault = {
      wins: assault_wins,
      losses: assault_losses,
      draws: assault_draws,
      wins_percent: @season.to_percent(assault_wins, @played[:assault]),
      losses_percent: @season.to_percent(assault_losses, @played[:assault]),
      draws_percent: @season.to_percent(assault_draws, @played[:assault])
    }


    control_wins = control_matches.where(result: Match.results[:win]).count
    control_losses = control_matches.where(result: Match.results[:lose]).count
    control_draws = control_matches.where(result: Match.results[:draw]).count
    @control = {
      wins: control_wins,
      losses: control_losses,
      draws: control_draws,
      wins_percent: @season.to_percent(control_wins, @played[:control]),
      losses_percent: @season.to_percent(control_losses, @played[:control]),
      draws_percent: @season.to_percent(control_draws, @played[:control])
    }
  end

  private

  def set_vars
    @matches = current_user.matches
                .current_season
                .includes(:map)
                .order(created_at: :asc)
    @season = Season.last
  end
end
