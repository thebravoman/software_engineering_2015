require 'word_counter/file_parser'

module WordCounter
	def self.parse_file(fname)
		FileParser.new.parse_file(fname)
	end
end