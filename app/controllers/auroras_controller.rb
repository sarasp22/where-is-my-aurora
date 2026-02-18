class AurorasController < ApplicationController
  def index
    @auroras = Aurora.active.recent
  end

def show
  @aurora = Aurora.find(params[:id])
  @minutes_ago = ((Time.current - @aurora.submitted_at) / 60).floor
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
end
