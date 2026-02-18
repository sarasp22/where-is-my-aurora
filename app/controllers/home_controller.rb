class HomeController < ApplicationController
  def index
    @auroras = Aurora.recent.limit(50)
    @auroras_json = @auroras.map do |a|
      { lat: a.latitude, lng: a.longitude, id: a.id, description: a.description }
    end.to_json
  end
end
