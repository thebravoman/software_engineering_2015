require_relative './word_counter/file_parser.rb'
require_relative './word_counter/parser.rb'
require_relative './word_counter/web_parser.rb'

module WordCounter
	def self.parse(string)
		Parser.new.parse(string)
	end

	def self.parse_file(filename)
		FileParser.new.parse_file(filename)
	end

	def self.parse_web(link)
		WebParser.new.parse_web(link)
	end
end