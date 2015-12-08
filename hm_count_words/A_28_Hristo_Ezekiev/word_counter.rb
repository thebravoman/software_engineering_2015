require 'word_counter/file_parser'
require 'word_counter/web_parser'
require 'word_counter/parser'

module WordCounter
	def self.parse(contents)
		Parser.newparse(contents)
	end

	def self.parse_file(filename)
		FileParser.new.parse(filename)
	end

	def self.parse_webpage(url)
		WebpageParser.new.parse(url)
	end
end
