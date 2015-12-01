require 'rexml/document'
require 'csv'
require 'rubygems'
require 'json'
require './B_21_Martin_Galabov/word_counter' 
file_path = ARGV[0]
command = ARGV[1]
if (file_path.start_with?('http://') || file_path.start_with?('https://'))
	result = WordCounter.web_parse
else
	result = WordCounter.parse_file file_path
end

if command == 'json' 
result.to_json
elsif command == 'xml' 
result.to_xml
elsif
result.to_csv
end







