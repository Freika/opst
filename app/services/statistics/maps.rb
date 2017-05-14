# Calculates statistics for maps.
class Statistics::Maps
  attr_reader :maps, :wins_per_map, :played, :played_percent, :hybrid,
              :escort, :assault, :control

  def initialize(matches, season, user)
    @matches = matches
    @season = season
    @user = user
  end

  def maps
    @season.maps_statistics(@matches, @user.id)
  end

  def wins_per_map
    @season.wins_percentage_per_map(@matches, @user.id)
  end

  def played
    {
      assault: assault_matches.size,
      escort: escort_matches.size,
      hybrid: hybrid_matches.size,
      control: control_matches.size
    }
  end

  def played_percent
    {
      hybrid: @season.to_percent(played[:hybrid], games_played),
      escort: @season.to_percent(played[:escort], games_played),
      assault: @season.to_percent(played[:assault], games_played),
      control: @season.to_percent(played[:control], games_played)
    }
  end

  Map.kinds.keys.each do |kind|
    define_method(kind) do
      instance_variable_set("played_#{kind}", played[:"#{kind}"])

      {
        wins: escort_wins,
        losses: escort_losses,
        draws: escort_draws,
        wins_percent: @season.to_percent(
          escort_wins, instance_variable_get("played_#{kind}", played[:"#{kind}"])
        ),
        losses_percent: @season.to_percent(
          escort_losses, instance_variable_get("played_#{kind}", played[:"#{kind}"])
        ),
        draws_percent: @season.to_percent(
          escort_draws, instance_variable_get("played_#{kind}", played[:"#{kind}"])
        )
      }
    end
  end

  private

  def games_played
    @matches.size
  end

  Map.kinds.keys.each do |kind|
    define_method("#{kind}_matches") do
      @matches.joins(:map).merge(Map.where(kind: kind))
    end
  end

  Map.kinds.keys.each do |kind|
    define_method("#{kind}_wins") do
      binding.local_variable_get("#{kind}_matches")
        .where(result: Match.results[:win]).size
    end
  end

  Map.kinds.keys.each do |kind|
    define_method("#{kind}_losses") do
      binding.local_variable_get("#{kind}_matches")
        .where(result: Match.results[:lose]).size
    end
  end

  Map.kinds.keys.each do |kind|
    define_method("#{kind}_draws") do
      binding.local_variable_get("#{kind}_matches")
        .where(result: Match.results[:draw]).size
    end
  end
end
