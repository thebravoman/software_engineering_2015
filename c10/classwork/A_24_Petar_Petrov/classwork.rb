require 'net/http'

url = URI.parse(ARGV[0])
site = Net::HTTP.get(url)
puts site
