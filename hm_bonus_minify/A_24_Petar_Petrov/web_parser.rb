require 'net/http'
require 'sanitize'
require 'openssl'
require_relative 'csv_parser.rb'

module Monefy
	class WebParser < CSVParser
		def parse_website(url)
			uri = URI.parse(url)
			http = Net::HTTP.new(uri.host, uri.port) 
			if uri.scheme == "https"
				http.use_ssl = true
				http.verify_mode = OpenSSL::SSL::VERIFY_NONE
			end
			request = http.get(uri.request_uri)
			text = Sanitize.fragment(request.body, :remove_contents => ['script','style'])
			csv = CSV.parse(text)
			read_csv(csv)
		end
		
		def read_csv(csv)
			super(csv)
		end
	end
end
