require 'json'
require 'pp'
require 'net/http'

city      = 'Sofia'
url       = 'http://api.openweathermap.org/data/2.5/weather'
query     = "q=#{city}&appid=bd82977b86bf27fb59a04b61b657fb6f"
uri       = URI("#{url}?#{query}")

forecast  = Net::HTTP.get(uri)
ruby_hash = JSON.parse(forecast, symbolize_names: true)

weather   = ruby_hash[:weather].first

puts city
puts JSON.pretty_generate(weather)
