require 'json'
require 'pp'
require 'net/http'

term = ARGV[0]

uri = URI("http://api.urbandictionary.com/v0/define?term=#{term}")
forecast = Net::HTTP.get(uri)

ruby_hash = JSON.parse(forecast, symbolize_names: true)

pp ruby_hash
