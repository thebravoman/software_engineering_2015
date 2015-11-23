require 'net/http'
require 'sanitize'
class ParseWeb
	def
	url = URI.parse(ARGV.first)
	puts Net::HTTP.get(url)
end
