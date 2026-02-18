class SessionsController < ApplicationController
  def set_geolocation
    session[:latitude] = params[:latitude]
    session[:longitude] = params[:longitude]
    render json: { status: "ok" }
  end

  def share_app
    render json: { url: root_url }
  end
end
