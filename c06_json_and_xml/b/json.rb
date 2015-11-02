require 'json'
require 'net/http'


# forecast =<<DATA
# {
#    "wind" : {
#       "deg" : 168.5,
#       "speed" : 6.26
#    },
#    "sys" : {
#       "sunset" : 1446136747,
#       "message" : 0.0085,
#       "country" : "GB",
#       "sunrise" : 1446101311
#    },
#    "rain" : {
#       "3h" : 0.25
#    },
#    "clouds" : {
#       "all" : 92
#    },
#    "base" : "cmc stations",
#    "weather" : [
#       {
#          "description" : "light rain",
#          "icon" : "10n",
#          "main" : "Rain",
#          "id" : 500
#       }
#    ],
#    "main" : {
#       "pressure" : 1010.02,
#       "temp" : 285.292,
#       "temp_min" : 285.292,
#       "temp_max" : 285.292,
#       "sea_level" : 1020.21,
#       "humidity" : 94,
#       "grnd_level" : 1010.02
#    },
#    "id" : 2643743,
#    "cod" : 200,
#    "dt" : 1446101175,
#    "coord" : {
#       "lon" : -0.13,
#       "lat" : 51.51
#    },
#    "name" : "London"
# }
# DATA

uri = URI('http://api.openweathermap.org/data/2.5/weather?q=Sofia,bg&appid=bd82977b86bf27fb59a04b61b657fb6f')
forecast = Net::HTTP.get(uri)

ruby_hash = JSON.parse(forecast, symbolize_names: true)

puts ruby_hash.keys.inspect
puts ruby_hash[:weather].first[:description]

puts JSON.pretty_generate({foo: [1,3,4]})
