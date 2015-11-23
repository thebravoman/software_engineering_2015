


require 'net/http'

url = URI.parse(ARGV[0])
html = Net::HTTP.get(url)

text = Sanitize.fragment(html)

puts text