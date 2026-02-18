class HomeController < ApplicationController
  def index
    @auroras = Aurora.active.recent.limit(50)
    @auroras_json = @auroras.map do |a|
      {
        lat: a.latitude,
        lng: a.longitude,
        id: a.id,
        description: a.description,
        minutes_ago: ((Time.current - a.submitted_at) / 60).floor
      }
    end.to_json
  end
end
