class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  def index
    @matches = Match.includes(:map).order(created_at: :asc)
    @season = Season.last

    # Season wins/draws/loses donut
    gon.first_match_sr = @season.matches.first.skill_rating
    gon.results_donut = @season.results_statistics

    # Season main statistics
    @games_played = @season.matches.count
    @wins = @season.matches.win.count
    @losses = @season.matches.lose.count
    @draws = @season.matches.draw.count
    @win_percent = @season.to_percent(@wins, @games_played)
    @lose_percent = @season.to_percent(@losses, @games_played)
    @draw_percent = @season.to_percent(@draws, @games_played)
    # TODO: implement
    @longest_win_streak = 10
    @longest_loss_streak = 8
    @average_gain = 22,53
    @average_loss = 22,12

    # Season skill rating chart
    gon.skill_rating_chart = @season.matches.map { |m| m.skill_rating }

    # Season Map types
    @assault_maps_played = @season.matches.joins(:map).merge(Map.where(kind: Map.kinds[:assault])).count
    @escort_maps_played = @season.matches.joins(:map).merge(Map.where(kind: Map.kinds[:escort])).count
    @hybrid_maps_played = @season.matches.joins(:map).merge(Map.where(kind: Map.kinds[:hybrid])).count
    @control_maps_played = @season.matches.joins(:map).merge(Map.where(kind: Map.kinds[:control])).count

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
