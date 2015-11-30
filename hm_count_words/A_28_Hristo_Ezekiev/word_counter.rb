require 'word_counter/parser'
require 'word_counter/file_parser'
require 'word_counter/website_parser'
require 'word_counter/result'

module WordCounter
    def self.parse(string)   
		Parser.new.parse(string)
	end     

    def self.parse_file(filename)
		FileParser.new.parse(filename)
	end

    def self.parse_webpage(url)   
		WebsiteParser.new.parse(url)
	end
	
	def self.marks
		Result.new.marks_count
	end
	
	def self.words
		Result.new.word_counts
	end
end     
