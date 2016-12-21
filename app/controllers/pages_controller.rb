class PagesController < ApplicationController
  def feedback
  end

  def how_to
  end

  def home
    @matches = Match.count
    @users = User.count
  end
end
