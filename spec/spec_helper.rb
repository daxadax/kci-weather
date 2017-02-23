ENV['RACK_ENV'] = 'test'

require 'sinatra'
require 'bundler'
Bundler.require

# require testing components
require 'rack/test'
require 'minitest/autorun'
Dotenv.load

# require application components
Dir.glob('./lib/**/*.rb') { |f| require f }
require './weather_app'
require 'json'

class BaseSpec < Minitest::Spec
  def expand_path(path)
    File.expand_path(path, __FILE__)
  end

  class FakeWeatherFetcher
  end
end

class AppSpec < BaseSpec
  include Rack::Test::Methods

  # otherwise it looks for views in the spec directory
  before { app.views = './views' }

  def app
    WeatherApp
  end
end
