class PagesController < ApplicationController
  def feedback
  end

  def how_to
  end

  def home
    @matches = Match.count
    @users = User.count

    render layout: false
  end
end
