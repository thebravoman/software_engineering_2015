#!/usr/bin/ruby
require_relative './word_counter/file_parser.rb'
require_relative './word_counter/web_parser.rb'
require_relative './word_counter/parser.rb'
require_relative './word_counter/result.rb'
require_relative './word_counter/folder_parser.rb'

module WordCounter
	def self.parse string
	  Parser.new.parse(string)
	end
	
	def self.parse_file path
	  FileParser.new.parse(path)
	end

	def self.parse_web path
	  WebParser.new.parse(path)
	end

	def self.parse_folder path
	  FolderParser.new.parse(path)
	end
end
