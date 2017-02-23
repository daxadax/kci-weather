require_relative 'spec_helper'

class ForecasterSpec < BaseSpec
  let(:result) { Forecaster.new(input) }

  describe 'a known location' do
    let(:input) do
      {
        data: fixture_data('san_francisco')
      }
    end

    it 'grants access to weather information' do
      assert_equal 'clear sky', result.description
      assert_equal 5.63, result.current_temp
      assert_equal 0, result.low_temp
      assert_equal 15, result.high_temp
      assert_equal '82%', result.humidity
      assert_equal 'San Francisco, US', result.location
    end

    it 'returns the unknown_location flag as false' do
      assert_equal false, result.unknown_location?
    end
  end

  describe 'an unknown location' do
    let(:input) do
      {
        data: fixture_data('city_not_found')
      }
    end

    it 'returns a null class' do
      assert_nil result.description
      assert_nil result.current_temp
      assert_nil result.low_temp
      assert_nil result.high_temp
      assert_nil result.humidity
      assert_nil result.location
    end

    it 'returns the unknown_location flag as true' do
      assert_equal true, result.unknown_location?
    end
  end

  def fixture_data(path)
    full_path = expand_path("../fixtures/#{path}.json")
    JSON.parse(File.read(full_path))
  end
end
