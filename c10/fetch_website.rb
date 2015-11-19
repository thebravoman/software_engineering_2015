require 'net/http'
require 'sanitize'
require 'openssl'

uri  = URI.parse(ARGV.first)

http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true

# This is bad..
# http://stackoverflow.com/questions/9199660/why-is-ruby-unable-to-verify-an-ssl-certificate#answer-9238221
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

result = http.get(uri.request_uri)

text = Sanitize.fragment(result.body)

puts text
