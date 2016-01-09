require_relative 'word_counter/parser'
require_relative 'word_counter/file_parser'
require_relative 'word_counter/web_parser'
require_relative 'word_counter/folder_parser'

module WordCounter
	def self.parse string
		Parser.new.parse_string string
	end     

	def self.parsing_the_file file
		FileParser.new.parse_file file
	end

	def self.parsing_web_page url
		WebParser.new.parse_web url
	end

	def self.parse_a_folder folder
		FolderParser.new.parse_folder folder
	end
end
