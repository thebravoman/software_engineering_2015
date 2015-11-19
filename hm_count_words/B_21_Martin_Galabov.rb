require 'rexml/document'
require 'csv'
require 'rubygems'
require 'json'
require './B_19_Martin_Galabov/word_counter' 
file_path = ARGV[0]
command = ARGV[1]

word_counter_class = WordCounter.new
result = word_counter_class.parse_file(file_path)

if command == 'json' 
result.to_json
elsif command == 'xml' 
result.to_xml
elsif
result.to_csv
end







