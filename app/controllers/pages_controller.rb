class PagesController < ApplicationController
  def feedback
  end

  def how_to
  end

  def home
    @matches = Match.count
    @users = User.count
    @wins = Match.where(result: Match.results[:win]).count
    @losses = Match.where(result: Match.results[:win]).count
    @draws = Match.where(result: Match.results[:win]).count
    @highest_rating = Match.order(skill_rating: :desc).first.skill_rating

    render layout: false
  end
end
