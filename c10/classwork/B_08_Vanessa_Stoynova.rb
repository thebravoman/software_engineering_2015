require 'net/http'

url = URI.parse(ARVG.first)
puts Net::HTTP.get(url)
