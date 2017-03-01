class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_qualification

  before_action do
    if current_user && current_user.email == 'frey@list.ru'
      Rack::MiniProfiler.authorize_request
    end
  end

  def set_qualification
    @qualification = current_user.qualifications.last
  end
end
