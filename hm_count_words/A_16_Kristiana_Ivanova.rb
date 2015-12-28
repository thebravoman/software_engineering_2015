require 'csv'
require 'json'
require 'rexml/document'
require 'word_counter'

filename = ARGV[0]
format = ARGV[1]

def file_site(filename)
	start = filename.split('/').first
  	return start == "http:" || start == "https:"
end

def get_result(filename, format)
  if File.file? filename
   get_result = WordCounter.parse_file filename
  elsif file_cite filename
    get_result = WordCounter.parse_webpage filename
  else
    get_result = Parser.parse filename
  end
end

if format == "json"
 puts get_result(filename, format).to_json
 get_result(filename, format).to_svg
elsif format == "xml"
 puts get_result(filename, format).to_xml
 get_result(filename, format).to_svg
elsif format == "svg"
 get_result(filename, format).to_svg
else
 get_result(filename, format).to_csv
 get_result(filename, format).to_svg
end