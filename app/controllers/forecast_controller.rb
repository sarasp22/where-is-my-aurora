class ForecastController < ApplicationController
  def index
  end

  def kp_now
    require 'net/http'
    require 'json'

    begin
      uri = URI('https://services.swpc.noaa.gov/json/planetary_k_index_1m.json')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri)
      response = http.request(request)
      data = JSON.parse(response.body)

      latest = data.last
      kp = latest ? latest['kp_index'].round(1) : nil

      render json: { kp: kp }
    rescue => e
      render json: { kp: nil, error: e.message }
    end
  end
end
