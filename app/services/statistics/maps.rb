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
      instance_variable_set("@played_#{kind}", played[:"#{kind}"])

      {
        wins: send("#{kind}_wins"),
        losses: send("#{kind}_losses"),
        draws: send("#{kind}_draws"),
        wins_percent: @season.to_percent(
          send("#{kind}_wins"),
          instance_variable_get("@played_#{kind}")
        ),
        losses_percent: @season.to_percent(
          send("#{kind}_losses"),
          instance_variable_get("@played_#{kind}")
        ),
        draws_percent: @season.to_percent(
          send("#{kind}_draws"),
          instance_variable_get("@played_#{kind}")
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
      send("#{kind}_matches")
        .where(result: Match.results[:win]).size
    end
  end

  Map.kinds.keys.each do |kind|
    define_method("#{kind}_losses") do
      send("#{kind}_matches")
        .where(result: Match.results[:lose]).size
    end
  end

  Map.kinds.keys.each do |kind|
    define_method("#{kind}_draws") do
      send("#{kind}_matches")
        .where(result: Match.results[:draw]).size
    end
  end
end
