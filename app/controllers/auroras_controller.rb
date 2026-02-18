class AurorasController < ApplicationController
  def index
    @auroras = Aurora.active.recent
  end

def show
  @aurora = Aurora.find(params[:id])
  @minutes_ago = ((Time.current - @aurora.submitted_at) / 60).floor

  if session[:latitude] && session[:longitude]
    @distance_km = haversine_distance(
      session[:latitude].to_f, session[:longitude].to_f,
      @aurora.latitude, @aurora.longitude
    )
  end
end

  def new
    @aurora = Aurora.new
    @lat = session[:latitude] || 48.8566
    @lng = session[:longitude] || 2.3522
  end

  def create
    @aurora = Aurora.new(aurora_params)
    @aurora.session_token = @current_token
    @aurora.submitted_at = Time.current

    if @aurora.save
      redirect_to root_path, notice: "Aurora segnalata! 🌌"
    else
      @lat = session[:latitude] || 48.8566
      @lng = session[:longitude] || 2.3522
      render :new
    end
  end

  private

  def aurora_params
    params.require(:aurora).permit(:latitude, :longitude, :description, :photo)
  end

  def haversine_distance(lat1, lng1, lat2, lng2)
  rad = Math::PI / 180
  dlat = (lat2 - lat1) * rad
  dlng = (lng2 - lng1) * rad
  a = Math.sin(dlat/2)**2 +
      Math.cos(lat1 * rad) * Math.cos(lat2 * rad) * Math.sin(dlng/2)**2
  (6371 * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a))).round(1)
  end

end
