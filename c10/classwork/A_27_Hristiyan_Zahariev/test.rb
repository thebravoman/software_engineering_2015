require 'net/http'
require 'sanitize'
require 'openssl'

uri = URI.parse(ARGV.first)

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERYFY_NONE

result = http.get(uri.request_uri)

text = Sanitize.fragment(html)

puts text


