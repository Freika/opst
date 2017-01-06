class QualificationsController < ApplicationController
  def create
  end

  def update
    @qualification = current_user.qualifications.find(params[:id])

    if @qualification.update(qualification_params)

      redirect_to matches_path, notice: "#{@qualification.season.name} season qualification saved."
    else
      redirect :back
    end
  end

  private

  def qualification_params
    params.require(:qualification).permit(:skill_rating, :wins, :losses, :draws)
  end
end
