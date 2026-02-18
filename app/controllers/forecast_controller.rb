class ForecastController < ApplicationController
  def index
  end

  def kp_now
    require 'net/http'
    require 'json'

    uri = URI('https://services.swpc.noaa.gov/json/planetary_k_index_1m.json')
    response = Net::HTTP.get(uri)
    data = JSON.parse(response)

    latest = data.last
    kp = latest ? latest['kp_index'].round(1) : nil

    render json: { kp: kp }
  end
end
