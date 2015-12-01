#!/usr/bin/ruby
require './B_11_Emil_Karbanov/TopKek/file_parser'
require './B_11_Emil_Karbanov/TopKek/web_parser'
require './B_11_Emil_Karbanov/TopKek/parser'
require './B_11_Emil_Karbanov/TopKek/result'
module WordCounter
def self.parse string
Parser.new.parse(string)
end
def self.parse_file path
FileParser.new.parse(path) end
def self.parse_web path WebParser.new.parse(path)
end
end
