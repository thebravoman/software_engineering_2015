

require 'net/http'

url = URI.parse(ARGV[0])
puts Net::HTTP.get(url)
