require 'net/http'

url=URI.parse(ARGV.first)

html=Net::HTTP.get(url)

puts html