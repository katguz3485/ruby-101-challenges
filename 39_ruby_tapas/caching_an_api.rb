require 'open-uri'
require 'json'
#
# class Weather
#   Report = Struct.new(:temperature)
#
#   def report(query)
#     key  = ENV['WUNDERGROUND_KEY']
#     url  = "http://api.wunderground.com/api/#{key}/conditions/q/#{query}.json"
#     body = open(url).read
#     data = JSON.parse(body)
#     Report.new(data['current_observation']['temp_f'])
#   end
# end

Weather.new.report(17361)

require 'rspec/autorun'

describe Weather do
  describe '#report' do
    it 'uses a cached value when available' do
      weather = Weather.new(cache: {'17361' => Weather::Report.new(-60.0) })
      weather.report.temperature.should eq(-60.0)
    end
  end
end

# class Weather
#   Report = Struct.new(:temperature)
#
#   def initialize(options={})
#     @cache = options.fetch(:cache){ {} }
#   end
#
#   def report(query)
#     key  = ENV['WUNDERGROUND_KEY']
#     url  = "http://api.wunderground.com/api/#{key}/conditions/q/#{query}.json"
#     body = open(url).read
#     data = JSON.parse(body)
#     @cache.fetch(query) {
#       Report.new(data['current_observation']['temp_f'])
#     }
#   end
# end
# class Weather
#   # ...
#   def report(query)
#     key  = ENV['WUNDERGROUND_KEY']
#     url  = "http://api.wunderground.com/api/#{key}/conditions/q/#{query}.json"
#     body = @cache.fetch(query) {
#       body = open(url).read
#     }
#     data = JSON.parse(body)
#     Report.new(data['current_observation']['temp_f'])
#   end
# end
# # ...
# describe Weather do
#   describe '#report' do
#     it 'uses a cached value when available' do
#       json = '{ "current_observation": { "temp_f": -60.0 } }'
#       weather = Weather.new(cache: {'17361' => json })
#       weather.report('17361').temperature.should eq(-60.0)
#     end
#   end
# end
class Weather

def report(query)
  key  = ENV['WUNDERGROUND_KEY']
  url  = "http://api.wunderground.com/api/#{key}/conditions/q/#{query}.json"
  body = @cache.fetch(query) {
    @cache[query] = open(url).read
  }
  data = JSON.parse(body)
  Report.new(data['current_observation']['temp_f'])
end
end
# ...
describe Weather do
  describe '#report' do
    # ...
    it 'populates the cache with new values' do
      json = '{ "current_observation": { "temp_f": -60.0 } }'
      expected_url =
          %r(http://api.wunderground.com/api/.*/conditions/q/17361.json)
      stub_request(:get, expected_url).to_return(body: json)
      cache = {}
      weather = Weather.new(cache: cache)
      weather.report('17361')
      cache['17361'].should eq(json)
    end
  end
end