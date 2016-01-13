#!/usr/bin/ruby
require './B_10_Dimitar_Djadjarov/Legit/file_parser'
require './B_10_Dimitar_Djadjarov/Legit/web_parser'
require './B_10_Dimitar_Djadjarov/Legit/parser'
require './B_10_Dimitar_Djadjarov/Legit/result'

module WordCounter
	
  def self.parse(string)
    Parser.new.parse_string(string)
  end

  def self.parsing_the_file(filename)
    FileParser.new.parse_file(filename)
  end

  def self.parsing_web_source(url)
    WebParser.new.parse_web(url)
  end

  def self.parse_folder(folder, format)
    FolderParse.new.parsing_folder(folder, format)
  end

end
