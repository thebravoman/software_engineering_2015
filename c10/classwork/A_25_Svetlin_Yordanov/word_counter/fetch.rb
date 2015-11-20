require 'net/http'

url = URI.parse(ARV.first)

html = Net::HTTP.get(url)
