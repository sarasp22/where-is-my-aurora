class ForecastController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    lat = session[:latitude] || 48.8566
    lng = session[:longitude] || 2.3522

    begin
      uri_kp = URI('https://services.swpc.noaa.gov/json/planetary_k_index_1m.json')
      http = Net::HTTP.new(uri_kp.host, uri_kp.port)
      http.use_ssl = true
      response_kp = http.request(Net::HTTP::Get.new(uri_kp))
      kp_data = JSON.parse(response_kp.body)

      kp_last = kp_data.last["kp_index"]
      @kp_current = kp_last ? kp_last.round(1) : 0

      @kp_history = kp_data.last(24).map do |entry|
        kp = entry["kp_index"]
        { time: entry["time_tag"], kp: kp ? kp.round(1) : 0 }
      end

      uri_forecast = URI('https://services.swpc.noaa.gov/json/geospace/geospace_pred_est_kp_1_hour.json')
      http2 = Net::HTTP.new(uri_forecast.host, uri_forecast.port)
      http2.use_ssl = true
      response_forecast = http2.request(Net::HTTP::Get.new(uri_forecast))
      forecast_data = JSON.parse(response_forecast.body)

      @kp_forecast = forecast_data.first(6).map do |entry|
        kp = entry["kp_index"]
        { time: entry["time_tag"], kp: kp ? kp.round(1) : 0 }
      end

      api_key = ENV["OPENWEATHER_API_KEY"]
      uri_weather = URI("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lng}&appid=#{api_key}&units=metric&lang=en")
      http3 = Net::HTTP.new(uri_weather.host, uri_weather.port)
      http3.use_ssl = true
      response_weather = http3.request(Net::HTTP::Get.new(uri_weather))
      weather_data = JSON.parse(response_weather.body)
      @cloud_cover = weather_data["clouds"]["all"]

    rescue => e
      @error = e.message
      Rails.logger.error "FORECAST ERROR: #{e.message}"
      Rails.logger.error e.backtrace.join("\n")
    end
  end

  def kp_now
    require 'net/http'
    require 'json'

    begin
      uri = URI('https://services.swpc.noaa.gov/json/planetary_k_index_1m.json')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      response = http.request(Net::HTTP::Get.new(uri))
      data = JSON.parse(response.body)
      latest = data.last
      kp = latest ? latest['kp_index']&.round(1) : nil
      render json: { kp: kp }
    rescue => e
      render json: { kp: nil, error: e.message }
    end
  end
end
