class PagesController < ApplicationController
  def feedback
  end

  def how_to
  end

  def home
    @matches = Match.count
    @users = User.count
    @wins = Match.where(result: Match.results[:win]).count
    @loses = Match.where(result: Match.results[:lose]).count
    @draws = Match.where(result: Match.results[:draw]).count
    @highest_rating = Match.order(skill_rating: :desc).first.skill_rating
    # @matches_graph = Match.period_count_array

    render layout: false
  end
end
