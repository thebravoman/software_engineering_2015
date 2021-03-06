require_relative './parser'
require 'net/http'
require 'sanitize'
require 'openssl'

module WordCounter
	class WebpageParser < Parser
    	def self.parse(url)
    		url = URI.parse(url)
      		http = Net::HTTP.new(url.host, url.port)

     		if url.scheme == 'https'
        		http.use_ssl = true
        		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      		end

      		contents = http.get(url.request_uri)
     		text = Sanitize.clean(contents.body, remove_contents: %w(script, style))
			result = Parser.parse(text)
			 return result
    	end
 	end
end
