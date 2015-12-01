require 'word_counter/parser.rb'
#require 'net/http'
#require 'openssl'
#require 'sanitize'
module WordCounter
	class WebParser < Parser
		def self.parse (url) 
	#		uri = URI.parse(url)
	#		http = Net::HTTP.new(uri.host, uri.port)
			
	#		if uri.scheme == 'https'
	#			http.use_ssl = true
	#			http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	#		end
	#		text = http.get(uri.request_uri)
	#		web_content = Sanitize.clean(text.body , remove_content: %w(script))
	#		super web_content
		end
	end
end
