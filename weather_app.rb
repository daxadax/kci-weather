class WeatherApp < Sinatra::Application
  ## GET

  get '/' do
    haml :home
  end

  get '/random' do
    lat = rand(-90.0..90.0)
    long = rand(-180.0..180.0)
    forecast = Forecaster.new(coordinates: [lat, long])

    serve_weather(forecast)
  end

  get '/city' do
    haml :get_city
  end

  ## POST

  post '/city' do
    city = params['city']
    country = params['country']
    forecast = Forecaster.new(city: "#{city}, #{country}")

    serve_weather(forecast)
  end

  private

  def serve_weather(forecast)
    if forecast.unknown_location?
      haml :unknown_location
    else
      haml :weather, locals: { forecast: forecast }
    end
  end
end
