class WeatherApp < Sinatra::Application
  get '/random' do
    # display the weather at random coordinates
  end

  post '/city' do
    # display the weather for the given city
    # gracefully handle unknown cities
    # optionally, cache the fetched weather data
  end
end
