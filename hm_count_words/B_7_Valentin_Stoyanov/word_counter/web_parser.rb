require 'net/http'
require 'sanitize'
require 'openssl'

module WordCounter
	class WebParser < Parser
		def web_parse url
			uri  = URI.parse url

			http = Net::HTTP.new uri.host, uri.port

			if uri.scheme == 'https'
				http.use_ssl = true
				http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			end

			result = http.get uri.request_uri
			text = Sanitize.fragment result.body
			result = parse text
			#save_in_db url, Digest::SHA256.digest(text), result.word_counts, result.marks_count
			result
		end
	end
end
