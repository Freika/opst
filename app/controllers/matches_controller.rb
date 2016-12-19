class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  def index
    @matches = current_user.matches
                .current_season
                .includes(:map)
                .order(created_at: :asc)
    @season = Season.last

    # Season wins/draws/loses donut
    gon.first_match_sr = @season.matches.first.skill_rating

    # Season skill rating chart


    assault_matches = @season.matches.joins(:map).merge(Map.where(kind: Map.kinds[:assault]))
    escort_matches = @season.matches.joins(:map).merge(Map.where(kind: Map.kinds[:escort]))
    hybrid_matches = @season.matches.joins(:map).merge(Map.where(kind: Map.kinds[:hybrid]))
    control_matches = @season.matches.joins(:map).merge(Map.where(kind: Map.kinds[:control]))
    # Season Map types

    # Map breakdown
    @maps = Map.all

    # Heroes breakdown

    # Games by maps donut
    gon.maps_statistics = @season.maps_statistics
    # Games by heroes donut
    # Wins per map percentage chart
    gon.wins_per_map = @season.wins_percentage_per_map
    # Wins per hero percentage chart
    gon.wins_percentage_per_hero = @season.wins_percentage_per_hero
  end

  def show
  end

  def new
    @match = Match.new
    @maps = Map.all.map { |map| [map.name, map.id] }
    @heroes = Hero.all.map { |hero| [hero.name, hero.id] }
  end

  def edit
    @maps = Map.all.map { |map| [map.name, map.id] }
    @heroes = Hero.all.map { |hero| [hero.name, hero.id] }
  end

  def create
    @match = Match.new(skill_rating: match_params[:skill_rating])
    @match.update_associations(match_params[:hero_ids], params[:map_id])

    respond_to do |format|
      if @match.save
        @match.update_skill_rating_diff
        @match.calculate_result
        @match.update_streak
        @match.save

        format.html { redirect_to matches_path, notice: 'Match was successfully created.' }
        format.json { render :show, status: :created, location: @match }
      else
        format.html { render :new }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @match.attributes = match_params
    @match.update_associations(match_params[:hero_ids], params[:map_id])
    @match.update_streak

    respond_to do |format|
      if @match.save
        @match.update_skill_rating_diff
        @match.calculate_result
        @match.save

        format.html { redirect_to matches_path, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_match
    @match = Match.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:map_ids, :skill_rating, hero_ids: [])
  end
end
