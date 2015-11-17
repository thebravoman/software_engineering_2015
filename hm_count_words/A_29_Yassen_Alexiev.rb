require 'csv'
require 'json'
require 'rexml/document'
require './А_29_Yassen_Alexiev/result'
require './А_29_Yassen_Alexiev/word_counter'

input_file = ARGV[0].to_s
format = ARGV[1].to_s
word_counter = WordCounter.new
result = word_counter.parse_file(input_file)
if format=="csv" or format == ""
	puts result.to_csv
end
if format=="json"
	puts result.to_json
end
if format=="xml" 
	puts result.to_xml
end