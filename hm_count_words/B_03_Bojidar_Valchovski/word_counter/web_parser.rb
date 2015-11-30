require 'net/http'
require 'sanitize'
require 'openssl'
require 'word_counter/parser'

module WordCounter
  class WebParser < Parser
	def parse(path)
      uri  = URI.parse(path)

      http = Net::HTTP.new(uri.host, uri.port)

      if uri.scheme == 'https'
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end
 
      result = http.get(uri.request_uri)

	  text = Sanitize.clean(result.body, :remove_contents => ['script', 'style'])

	  super text
    end
  end
end
