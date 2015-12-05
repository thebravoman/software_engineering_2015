require './word_counter/file_parser.rb'
require './word_counter/web_parser.rb'
require './word_counter/parser.rb'

class WordCounter

	def self.parse(string)
		Parser.new.parse(string)
	end
	
	def self.parse_file(file_name)
		FileParser.new.parse(file_name)
	end
	
	def self.parse_webpage(url)
		WebpageParser.new.parse(url)
	end
end
