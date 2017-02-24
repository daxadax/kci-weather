require_relative 'spec_helper'

class WeatherAppSpec < AppSpec
  let(:params) { Hash.new }

  describe 'GET' do
    let(:result) { get path, params }

    describe '/' do
      let(:path) { '/' }

      it 'handles the request' do
        assert_equal 200, result.status
      end
    end

    describe '/random' do
      let(:path) { '/random' }

      it 'handles the request' do
        assert_equal 200, result.status
      end
    end

    describe '/city' do
      let(:path) { '/city' }

      it 'handles the request' do
        assert_equal 200, result.status
      end
    end
  end

  describe 'POST' do
    let(:params) do
      { 'city': 'berlin, germany' }
    end
    let(:result) { post path, params }

    describe '/city' do
      let(:path) { '/city' }

      it 'handles the request' do
        assert_equal 200, result.status
      end
    end
  end
end
