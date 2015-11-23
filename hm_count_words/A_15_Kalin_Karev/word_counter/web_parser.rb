require_relative './parser'
require 'net/http'
require 'sanitize'
require 'openssl'

module WordCounter
	class WebsiteParser<Parser
		def self.parser(uri)
			uri = URI.parse(uri)
			http = Net::HTTP.new(uri.host, uri.port)
			if uri.scheme == 'https'
				http.use_ssl = true
				http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			end
			c = http.get(uri.request_uri)
			work_with = Sanitize.fragment(c.body).gsub!(/(<[^>]*>)|\n|\t/, " "))
			super work_with
		end
	end
end
