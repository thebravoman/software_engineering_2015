require 'net/http'

url = URI.parse(ARGV[0])
html = Net::HTTP.get(url)
puts html
