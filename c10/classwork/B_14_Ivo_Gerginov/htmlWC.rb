require 'net/http'
require 'sanitize'
#require 'open-uri'

url = URI.parse(ARGV[0])
html = Net::HTTP.get(url)
t = Sanitize.fragment(html, Sanitize::Config::RELAXED)
puts t
#puts src = open(url, &:read)