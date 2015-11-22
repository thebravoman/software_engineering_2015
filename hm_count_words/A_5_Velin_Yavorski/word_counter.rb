require 'word_counter/parser'
require 'word_counter/file_parser'
require 'word_counter/website_parser'

module WordCounter
    def self.parse(string)   
			Parser.parse(string)
		end     

    def self.parse_file(filename)
			FileParser.parse(filename)
		end

    def self.parse_webpage(url)   
			WebsiteParser.parse(url)
		end
end     
