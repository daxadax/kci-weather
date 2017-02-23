class WeatherFetcher
  def initialize(options = {})
    @coordinates = options[:coordinates]
    @city = options[:city]
  end

  def data
    response = fetch_coordinates_response if coordinates
    response = fetch_city_response if city

    JSON.parse(response.body)
  end

  private
  attr_reader :coordinates, :city


  def fetch_coordinates_response
    lat = coordinates.first
    lon = coordinates.last
    fetch_response("&lat=#{lat}&lon=#{lon}")
  end

  def fetch_city_response
    fetch_response("&q=#{city}")
  end

  def fetch_response(query)
    uri = base_url + base_options + query
    HTTParty.get(uri)
  end

  def base_url
    "http://api.openweathermap.org/data/#{ENV['OPENWEATHER_VERSION']}/weather"
  end

  def base_options
    "?units=metric&APPID=#{ENV['OPENWEATHER_KEY']}"
  end
end
