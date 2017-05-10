class MatchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  def index
    load_matches_and_season
    calculate_season_data

    respond_to do |format|
      format.html
      format.csv do
        send_data @export_matches.to_csv, filname: "#{current_user.email}_matches_#{Date.today}"
      end
    end
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
    number =
      if current_user.matches.last.present? && current_user.matches.last.persisted?
        current_user.matches.last.number + 1
      else
        1
      end
    @match = current_user.matches.build(
      skill_rating: match_params[:skill_rating], number: number,
      party_size: match_params[:party_size], comment: match_params[:comment],
      rounds: match_params[:rounds]
    )
    @match.update_associations(match_params[:hero_ids], params[:map_id])

    if @match.save
      @match.update_skill_rating_diff
      if @match.skill_rating == 0
        flash[:error] = 'You must provide skill rating'
        render :new and return
      end
      @match.calculate_result
      @match.update_streak
      @match.save

      load_matches_and_season
      redirect_to matches_path, notice: 'Match created.'
    else
      render :new
    end
  end

  def update
    @match.attributes = match_params
    @match.update_associations(match_params[:hero_ids], params[:map_id])
    @match.update_streak

    if @match.save
      @match.update_skill_rating_diff
      if @match.skill_rating == 0
        flash[:error] = 'You must provide skill rating'
        render :edit and return
      end
      @match.calculate_result
      @match.update_streak
      @match.save

      load_matches_and_season
      redirect_to matches_path, notice: 'Match updated.'
    else
      render :edit
    end
  end

  def destroy
    @match.destroy
    MatchesRecalculatorWorker.perform_async(current_user.id)
    load_matches_and_season
    redirect_to matches_path, notice: 'Match destroyed'
  end

  private

  def set_match
    @match = current_user.matches.find(params[:id])
  end

  def match_params
    params.require(:match).permit(
      :map_ids, :skill_rating, :comment, :rounds, :party_size, hero_ids: []
    )
  end

  def load_matches_and_season
    matches = current_user.matches
                .current_season
                .includes(:map, :destination, :heros)
                .order(created_at: :desc)

    @matches = matches.paginate(page: params[:page], per_page: 20)
    @export_matches = matches
    @season = Season.current
  end

  def calculate_season_data
    @end_of_season = DateTime.new(2017, 05, 30)
    @days_left = @end_of_season.mjd - DateTime.now.mjd
    @rating = @export_matches.maximum(:skill_rating)

    if @export_matches.any?
      current_rating = @export_matches.first.skill_rating
      next_league = nil

      Qualification::LEAGUES.each.with_index do |league, index|
        if league[:range].include?(@rating)
          @league = league[:name]
          next_league = Qualification::LEAGUES[index + 1]
          break
        end
      end


      # There is no league higher than Grandmaster
      if @league == 'Grandmaster'
        next_league = @league
      else
        rating_left = next_league[:range].first - current_rating

        @sr_per_day = (rating_left.to_f / @days_left).ceil
        @next_league = next_league[:name]
      end
    end
  end
end
