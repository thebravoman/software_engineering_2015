require 'net/http'
require 'sanitize'

url = URI.parse(ARGV.first)
html = Net::HTTP.get(url)

text = Sanitize.fragment(html)
puts text
