require 'rubygems'
require 'bundler/setup'
require 'dotenv'
require 'sass/plugin/rack'
require 'sass'
require 'json'

#Sass::Plugin.options[:style] = :compressed
use Sass::Plugin::Rack

Dotenv.load
Bundler.require

Dir.glob('./lib/*.rb') { |f| require f }
require './weather_app'

run WeatherApp
