class ApplicationController < ActionController::Base
  before_action :set_anonymous_session

  private

  def set_anonymous_session
    unless session[:user_token]
      session[:user_token] = SecureRandom.hex(16)
    end
    @current_token = session[:user_token]
  end
end
