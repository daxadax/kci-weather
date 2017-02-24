class Forecaster
  def initialize(options = {})
    @data = options.fetch(:data) { fetch_weather_data(options) }
  end

  def unknown_location?
    return true if data['cod'] != 200
    false
  end

  def description
    forecast[:description]
  end

  def current_temp
    forecast[:current_temp]
  end

  def low_temp
    forecast[:low_temp]
  end

  def high_temp
    forecast[:high_temp]
  end

  def humidity
    forecast[:humidity]
  end

  def location
    forecast[:location]
  end

  private
  attr_reader :data, :weather_fetcher

  def fetch_weather_data(options)
    WeatherFetcher.new(options).data
  end

  def forecast
    return Hash.new unless data['weather']
    {
      description: data['weather'][0]['description'],
      current_temp: data['main']['temp'],
      low_temp: data['main']['temp_min'],
      high_temp: data['main']['temp_max'],
      humidity: "#{data['main']['humidity']}%",
      location: get_location(data)
    }
  end

  def get_location(data)
    if data['name'].empty?
      "Lat: #{data['coord']['lat']}, Long: #{data['coord']['lon']}"
    else
      "#{data['name']}, #{data['sys']['country']}"
    end
  end
end
