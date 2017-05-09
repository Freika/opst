class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_qualification, if: :signed_in?

  before_action do
    if current_user && current_user.email == 'frey@list.ru'
      Rack::MiniProfiler.authorize_request
    end
  end

  def set_qualification
    @qualification = current_user.qualifications.last
  end

  protected

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
