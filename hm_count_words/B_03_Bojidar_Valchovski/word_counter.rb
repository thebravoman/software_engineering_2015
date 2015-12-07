#!/usr/bin/ruby
require './B_03_Bojidar_Valchovski/word_counter/file_parser'
require './B_03_Bojidar_Valchovski/word_counter/web_parser'
require './B_03_Bojidar_Valchovski/word_counter/parser'
require './B_03_Bojidar_Valchovski/word_counter/result'

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
end
