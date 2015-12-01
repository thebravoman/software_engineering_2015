require 'csv'
require 'json'
require 'rexml/document'
require './A_16_Kristiana_Ivanova/word_counter.rb'
require './A_16_Kristiana_Ivanova/word_counter/result'

filename = ARGV[0]
format = ARGV[1]

def file_site(filename)
	start = string.split('/').first
  	return start == "http:" || start == "https:"
end

def get_result(filename, format)
  if File.file? filename
    WordCounter.parse_file filename
  elsif file_cite filename
    get_result = WordCounter.parse_webpage filename
  else
    get_result = Parser.parse filename
  end
end

if format == "json"
 puts get_result(filename, format).to_json
elsif format == "xml"
 puts get_result(filename, format).to_xml
elsif format == "svg"
 puts get_result(filename, format).to_svg
else
 puts get_result(filename, format).to_csv
end