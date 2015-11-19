require 'net/http'
url=URI.parse(argv.first)
puts Net::HTTP.get(url)
