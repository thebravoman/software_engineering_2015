require 'word_counter/parser.rb'
require 'word_counter/file_parser.rb'
require 'word_counter/web_parser.rb'

module WordCounter 

	def self.parse (text)
		Parser.parse (text)
	end
	
	def self.parse_file (file)
		FileParser.parse (file)
	end
	
	def self.parse_webpage (url)
		WebParser.parse (url)
	end
end
