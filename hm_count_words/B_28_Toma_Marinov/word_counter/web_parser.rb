require_relative './parser'

require 'net/http'
require 'sanitize'    #-cannot load such file --sanitize
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
			text = Sanitize.clean(result.body, remove_contents: %w(script))

			some_hash = Hash.new(0)
			counter = 0.to_i

			text.each_line do |line|
				result = super(line)
				some_hash = some_hash.merge(result.hash.to_h) { |key, oldval, newval| oldval + newval }

				counter += result.count
			end

			sorted = Hash.new(0)
			sorted = some_hash.sort_by { |key, value| [-value, key] }

			Result.new(sorted, counter)
		end
	end
end