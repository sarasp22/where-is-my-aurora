class AurorasController < ApplicationController
  def index
    @auroras = Aurora.recent.limit(20)
  end

  def show
    @aurora = Aurora.find(params[:id])
  end

  def new
    @aurora = Aurora.new
  end

  def create
    @aurora = Aurora.new(aurora_params)
    @aurora.session_token = @current_token
    @aurora.submitted_at = Time.current
    if @aurora.save
      redirect_to root_path, notice: "Aurora segnalata! 🌌"
    else
      render :new
    end
  end

  private

  def aurora_params
    params.require(:aurora).permit(:latitude, :longitude, :kp_index, :description, :photo)
  end
end
