require_relative './word_counter/file_parser.rb'
require_relative './word_counter/parser.rb'

module WordCounter
	def self.parse(string)
		Parser.new.parse(string)
	end

	def self.parse_file(filename)
		FileParser.new.parse_file(filename)
	end
end