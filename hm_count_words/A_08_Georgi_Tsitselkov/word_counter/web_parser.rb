require 'word_counter/parser'
require 'net/http'
require 'openssl'
require 'sanitize'

module WordCounter
	class WebpageParser < Parser
	    def parse(url)
		    url= URI.parse(url)
		      
		    http = Net::HTTP.new(url.host, url.port)

		    if url.scheme == 'https'
				http.use_ssl = true
				http.verify_mode = OpenSSL::SSL::VERIFY_NONE
		    end

		    arr = http.get(url.request_url)
		      
		    text = Sanitize.fragement(arr.body)
	    	    super text
	    end
      end
end
