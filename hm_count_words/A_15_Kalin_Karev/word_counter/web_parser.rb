require_relative './parser'
require 'net/http'
require 'sanitize'
require 'openssl'

module WordCounter
	class WebpageParser < Parser
		def parse(uri)
			uri = URI.parse(ARGV.first)
			http = Net::HTTP.new(uri.host, uri.port)
			if uri.scheme == 'https'
				http.use_ssl = true
				http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			end
			c = http.get(uri.request_uri)
			c = Sanitize.fragment(c.body)
			super c
		end
	end
end
