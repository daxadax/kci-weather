require_relative 'spec_helper'

class WeatherAppSpec < AppSpec
  let(:params) { Hash.new }

  describe 'GET /random' do
    let(:result) { get 'random', params }

    it 'handles the request' do
      assert_equal 200, result.status
    end
  end

  describe 'POST /city' do
    let(:result) { post 'city', params }

    it 'handles the request' do
      assert_equal 200, result.status
    end
  end
end
