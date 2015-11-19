require 'net/http'
require 'sanitize'

url = URI.parse(ARGV.first)
html = Net::HTTP.get(url)
#puts html

text = Sanitize.fragment(html)

puts text
