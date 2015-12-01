require 'net/http'
require 'sanitize'
require 'openssl'

module WordCounter
  class WebParser
  	def parseURL url
	  uri  = URI.parse(url)
	  http = Net::HTTP.new(uri.host, uri.port)
	  if uri.scheme == 'https'
		http.use_ssl = true
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	  end

	  result = http.get(uri.request_uri)
	  text = Sanitize.fragment(result.body)
	  WordCounter::parseStr text
	end
  end
 end
