class UsersController < ApplicationController
  before_action :set_vars, only: :show

  def show
    @user = User.find(params[:id])

    unless @user.battletag
      flash[:notice] = "This user haven't provide battletag to make his profile public yet."
      redirect_to root_path and return
    end

    statistics = Statistics::General.new(@matches, @season, current_user)

    @general_stats = statistics.data
    @skill_rating_chart = statistics.skill_rating_chart
    @streaks = statistics.streaks
  end
end
