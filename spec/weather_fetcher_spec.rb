require_relative 'spec_helper'

class WeatherFetcherSpec < BaseSpec
  let(:result) { WeatherFetcher.new(input).data }

  describe 'coordinates input' do
    let(:input) do
      { coordinates: [37, -122] }
    end

    it 'fetches the data and converts it from JSON' do
      assert_equal 200, result['cod']
      assert_kind_of Hash, result
    end
  end

  describe 'city input' do
    let(:input) do
      { city: 'san francisco' }
    end

    it 'fetches the data and converts it from JSON' do
      assert_equal 200, result['cod']
      assert_kind_of Hash, result
    end
  end
end
