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

  def hybrid
    {
      wins: hybrid_wins,
      losses: hybrid_losses,
      draws: hybrid_draws,
      wins_percent: @season.to_percent(hybrid_wins, played[:hybrid]),
      losses_percent: @season.to_percent(hybrid_losses, played[:hybrid]),
      draws_percent: @season.to_percent(hybrid_draws, played[:hybrid])
    }
  end

  def escort
    {
      wins: escort_wins,
      losses: escort_losses,
      draws: escort_draws,
      wins_percent: @season.to_percent(escort_wins, played[:escort]),
      losses_percent: @season.to_percent(escort_losses, played[:escort]),
      draws_percent: @season.to_percent(escort_draws, played[:escort])
    }
  end

  def assault
    {
      wins: assault_wins,
      losses: assault_losses,
      draws: assault_draws,
      wins_percent: @season.to_percent(assault_wins, played[:assault]),
      losses_percent: @season.to_percent(assault_losses, played[:assault]),
      draws_percent: @season.to_percent(assault_draws, played[:assault])
    }
  end

  def control
    {
      wins: control_wins,
      losses: control_losses,
      draws: control_draws,
      wins_percent: @season.to_percent(control_wins, played[:control]),
      losses_percent: @season.to_percent(control_losses, played[:control]),
      draws_percent: @season.to_percent(control_draws, played[:control])
    }
  end

  private

  def games_played
    @matches.size
  end

  def assault_matches
    @matches.joins(:map).merge(Map.where(kind: Map.kinds[:assault]))
  end

  def escort_matches
    @matches.joins(:map).merge(Map.where(kind: Map.kinds[:escort]))
  end

  def hybrid_matches
    @matches.joins(:map).merge(Map.where(kind: Map.kinds[:hybrid]))
  end

  def control_matches
    @matches.joins(:map).merge(Map.where(kind: Map.kinds[:control]))
  end

  def hybrid_wins
    hybrid_matches.where(result: Match.results[:win]).size
  end

  def hybrid_losses
    hybrid_matches.where(result: Match.results[:lose]).size
  end

  def hybrid_draws
    hybrid_matches.where(result: Match.results[:draw]).size
  end


  def escort_wins
    escort_matches.where(result: Match.results[:win]).size
  end

  def escort_losses
    escort_matches.where(result: Match.results[:lose]).size
  end

  def escort_draws
    escort_matches.where(result: Match.results[:draw]).size
  end


  def assault_wins
    assault_matches.where(result: Match.results[:win]).size
  end

  def assault_losses
    assault_matches.where(result: Match.results[:lose]).size
  end

  def assault_draws
    assault_matches.where(result: Match.results[:draw]).size
  end

  def control_wins
    control_matches.where(result: Match.results[:win]).size
  end

  def control_losses
    control_matches.where(result: Match.results[:lose]).size
  end

  def control_draws
    control_matches.where(result: Match.results[:draw]).size
  end
end
