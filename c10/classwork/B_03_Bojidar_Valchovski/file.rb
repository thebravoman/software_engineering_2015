require 'net/http'

url = URI.parse(ARGV[0])
puts NET::HTTP.get(url)
