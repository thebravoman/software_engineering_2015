require 'word_counter/parser'
require 'net/http'
require 'sanitize'
require 'openssl'

module WordCounter
	class WebParser < Parser 
		def self.parse(url)
			url = URI.parse(url)
			http = Net::HTTP.new(uri.host, uri.port)
			
			if uri.scheme == 'https' 
				http.use_ssl = true 
				http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			end
			
			result = http.get(url.request_uri)
			text = Sanitize.clean(result.body, remove_result: %w(script, style))
			super text
		end
	end
end
		end
	end
end

