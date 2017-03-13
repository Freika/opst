class StatisticsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_vars

  def main
    statistics = Statistics::Main.new(@matches, @season, current_user)

    @main_stats = statistics.data
    @skill_rating_chart = statistics.skill_rating_chart
    @streaks = statistics.streaks
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

    statistics = Statistics::Maps.new(@matches, @season, current_user)

    @maps_statistics  = statistics.maps
    @wins_per_map     = statistics.wins_per_map
    @played           = statistics.played
    @played_percent   = statistics.played_percent
    @hybrid           = statistics.hybrid
    @escort           = statistics.escort
    @assault          = statistics.assault
    @control          = statistics.control
  end

  private

  def set_vars
    @seasons = Match.seasons(current_user)

    if params[:season]
      @season = Season.find(params[:season])
      @matches = current_user.matches
                  .where(season_id: @season.id)
                  .includes(:map)
                  .order(created_at: :asc)
    else
      @matches = current_user.matches
                  .current_season
                  .includes(:map)
                  .order(created_at: :asc)
      @season = Season.current
    end
  end
end
