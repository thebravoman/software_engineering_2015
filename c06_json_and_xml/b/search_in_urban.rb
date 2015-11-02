require 'json'
require 'net/http'
require 'pp'

search_term = ARGV[0]

url = "http://api.urbandictionary.com/v0/define?term=#{search_term}"

result = Net::HTTP.get(URI(url))

ruby_hash = JSON.parse(result, symbolize_names: true)

pp ruby_hash
