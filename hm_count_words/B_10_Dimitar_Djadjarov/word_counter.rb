#!/usr/bin/ruby
require './B_10_Dimitar_Djadjarov/Legit/file_parser'
require './B_10_Dimitar_Djadjarov/Legit/web_parser'
require './B_10_Dimitar_Djadjarov/Legit/parser'
require './B_10_Dimitar_Djadjarov/Legit/result'

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
