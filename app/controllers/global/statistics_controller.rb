class Global::StatisticsController < ApplicationController
  before_action :set_vars

  def general
    statistics = Statistics::General.new(@matches, @season, current_user)

    @general_stats = statistics.data
    @skill_rating_chart = statistics.skill_rating_chart
    @streaks = statistics.streaks
  end

  def heroes
    @heroes = Hero.all
    @heroes_statistics = {
      wins: @season.heroes_wins(current_user.id),
      losses: @season.heroes_loses(current_user.id),
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
end
