require 'net/'
require 'sanitizze'

url = URI.parse(ARGV.first)
html = Net::HTTP.get(url)
puts html
