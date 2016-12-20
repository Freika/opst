class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  def index
    @matches = current_user.matches
                .current_season
                .includes(:map)
                .order(created_at: :asc)
    @season = Season.last
  end

  def show
  end

  def new
    @match = current_user.matches.build
    @maps = Map.all.map { |map| [map.name, map.id] }
    @heroes = Hero.all.map { |hero| [hero.name, hero.id] }
  end

  def edit
    @maps = Map.all.map { |map| [map.name, map.id] }
    @heroes = Hero.all.map { |hero| [hero.name, hero.id] }
  end

  def create
    @match = current_user.matches.build(skill_rating: match_params[:skill_rating])
    @match.update_associations(match_params[:hero_ids], params[:map_id])

    respond_to do |format|
      if @match.save
        @match.update_skill_rating_diff
        @match.calculate_result unless Match.first_in_season?
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
        @match.calculate_result unless Match.first_in_season?
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
    @match = current_user.matches.find(params[:id])
  end

  def match_params
    params.require(:match).permit(:map_ids, :skill_rating, :result, hero_ids: [])
  end
end
