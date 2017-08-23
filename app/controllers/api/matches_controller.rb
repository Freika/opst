class Api::MatchesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    p match_params

    current_user = User.find_by(email: 'frey@list.ru')

    number =
      if have_matches?(current_user)
        current_user.matches.last.number + 1
      end

    match = current_user.matches.build(
      skill_rating: match_params[:rating],
      # party_size: match_params[:party_size], comment: match_params[:comment],
      # rounds: match_params[:rounds]
    )

    match.number = number if number
    match.update_associations(match_params[:hero], params[:map])

    if match.save
      match.update_skill_rating_diff

      return if match.skill_rating == 0

      match.calculate_result
      match.update_streak
      match.save
    end

    render json: match_params
  end

  def have_matches?(user)
    user.matches.last.present? && user.matches.last.persisted?
  end

  def match_params
    params.permit(:map, :rating, hero: [])
  end
end
