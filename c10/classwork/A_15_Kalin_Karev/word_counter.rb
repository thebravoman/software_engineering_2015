require 'word_counter/parser'
require 'word_counter/file_parser'
require 'word_counter/result'
require 'word_counter/web_parser'

module WordCounter
	def self.parse(string)
		Parser.new.parse(string)
	end
	
	def self.parse_file(filename)
		FileParser.new.parse_file(filename) 
	end
	
	def self.web_parser() 
		
	end
end

#puts WordCounter.parse_file(ARGV.first).to_xml
