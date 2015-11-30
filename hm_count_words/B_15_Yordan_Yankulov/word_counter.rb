require_relative 'word_counter/parser'
require_relative 'word_counter/file_parser'
require_relative 'word_counter/web_parser'
require_relative 'word_counter/result'


module WordCounter
	def self.parse(string)
		Parser.new.parse(string)
	end

	def self.parse_file(file)
		FileParser.new.parse_file(file)
	end

	def self.parse_webpage(address)
		WebpageParser.new.parse_url(address)
	end
end
