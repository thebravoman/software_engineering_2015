require 'word_counter/file_parser'
require 'word_counter/web_parser'
require 'word_counter/parser'

module WordCounter
	def self.parse(string)
		Parser.new.parse(string)
	end 

	def self.parse_file(filename)
    		FileParser.new.parse(filename)
  	end
 
  	def self.parse_webpage(url)
  		WebParser.new.parse(url)
 	end
end

