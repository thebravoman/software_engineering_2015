require 'word_counter/file_parser'

module WordCounter
	def self.parse_file(filename)
		FileParser.new.parse_file(filename)
	end	
end
