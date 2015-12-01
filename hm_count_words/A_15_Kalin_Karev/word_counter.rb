require_relative './word_counter/file_parser'
require_relative './word_counter/web_parser'

module WordCounter
	def self.parse(text)
		Parser.parse text
	end
	def self.parse_file(filename)
		FileParser.parse filename
	end
	def self.parse_web(url)
		WebsiteParser.parse url
	end
end
