require_relative './parser'

require 'net/http'
require 'sanitize'
require 'openssl'

module WordCounter
	class WebParser < Parser
		def parse_web(link)
			url = URI.parse(link)
			#html = Net::HTTP.get(url)
			http = Net::HTTP.new(url.host, url.port)
			#text = Sanitize.fragment(html)

			if url.scheme == 'https'
				http.use_ssl = true

				http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			end

			result = http.get(url.request_uri)
			text = Sanitize.fragment(result.body)

			parse text
		end
	end
end