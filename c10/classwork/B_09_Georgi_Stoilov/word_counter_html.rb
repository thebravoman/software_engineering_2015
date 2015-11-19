require 'open-uri'

url = ARGV[0]
puts source = open(url, &:read)

