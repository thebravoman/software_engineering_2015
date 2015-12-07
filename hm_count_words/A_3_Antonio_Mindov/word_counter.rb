require 'word_counter/file_parser'
require 'word_counter/web_parser'
require 'word_counter/parser'

module WordCounter
	def self.parse(contents)
		Parser.parse contents
	end

	def self.parse_file(filename)
		FileParser.parse filename
	end

	def self.parse_webpage(url)
		WebpageParser.parse url
	end
end