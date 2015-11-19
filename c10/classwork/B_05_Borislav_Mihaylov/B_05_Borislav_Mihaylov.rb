require 'net/http'

url = URI.parse(ARGV.first)
puts Net::HTTP.get(url)

