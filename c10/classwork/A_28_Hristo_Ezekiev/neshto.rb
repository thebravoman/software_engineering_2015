require 'net/http'
require 'sanitise'

url = URI.parse(ARGV[0])

html = Net::HTTP.get(url)

text = Sanitise.fragment(html)

puts text
