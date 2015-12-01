require 'net/http'
require 'sanitize'

url = URI.parse(ARGV.first)
puts Net::HTTP.get(url)
