require 'net/http'
require 'sanitize'

url  = URI.parse(ARGV.first)

html = Net::HTTP.get(url, use_ssl: true)

text = Sanitize.fragment(html)

puts text
