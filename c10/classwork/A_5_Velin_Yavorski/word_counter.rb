require 'word_counter/file_parser.rb'
require 'word_counter/parser.rb'
require 'word_counter/web_parser.rb'

module WordCounter
	def self.parse_file(filename)
		FileParser.new
	end
	
	def self.parse(string)
		Parser.new.parse(string)
	end
	
	def self.parse_website(url)
	
	end
end

