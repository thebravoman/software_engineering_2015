require 'net/http'

#require 'open-uri'
#url = ARGV[0]
#puts source = open(url, &:read)

url = URI.parse(ARGV[0])
puts Net::HTTP.get(url)

