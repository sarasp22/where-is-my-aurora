module WeatherHelper
  def weather_emoji(code)
    case code
    when 200..232 then "⛈️ Thunderstorm"
    when 300..321 then "🌦️ Drizzle"
    when 500      then "🌧️ Light rain"
    when 501      then "🌧️ Moderate rain"
    when 502..504 then "🌧️ Heavy rain"
    when 511      then "🌨️ Freezing rain"
    when 520..531 then "🌦️ Shower rain"
    when 600..601 then "❄️ Snow"
    when 602      then "❄️ Heavy snow"
    when 611..616 then "🌨️ Sleet"
    when 620..622 then "🌨️ Snow shower"
    when 701      then "🌫️ Mist"
    when 711      then "💨 Smoke"
    when 721      then "🌫️ Haze"
    when 731,761  then "🌪️ Dust"
    when 741      then "🌫️ Fog"
    when 751      then "🏜️ Sand"
    when 762      then "🌋 Ash"
    when 771      then "💨 Squall"
    when 781      then "🌪️ Tornado"
    when 800      then "☀️ Clear sky"
    when 801      then "🌤️ Few clouds"
    when 802      then "⛅ Scattered clouds"
    when 803      then "🌥️ Broken clouds"
    when 804      then "☁️ Overcast"
    else "🌡️ Unknown"
    end
  end
end
