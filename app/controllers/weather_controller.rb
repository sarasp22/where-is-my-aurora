class WeatherController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    lat = session[:latitude] || 48.8566
    lng = session[:longitude] || 2.3522
    api_key = ENV["OPENWEATHER_API_KEY"]

    begin
      uri = URI("https://api.openweathermap.org/data/2.5/weather?lat=#{lat}&lon=#{lng}&appid=#{api_key}&units=metric&lang=en")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri)
      response = http.request(request)
      @weather = JSON.parse(response.body)
    rescue => e
      @weather = nil
      @error = e.message
    end
  end
end
