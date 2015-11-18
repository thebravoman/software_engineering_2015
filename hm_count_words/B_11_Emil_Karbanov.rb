require 'csv'
require 'json'
require 'rexml/document'
require './B_11_Emil_Karbanov/Result'
require './B_11_Emil_Karbanov/WordCounter'
filename = ARGV[0]
option = ARGV[1]
word_counter = WordCounter.new
result = word_counter.parse_file ARGV[0]
if option == "csv"
	result.to_csv
elsif option == "json"
	puts result.to_json
elsif option == "xml"
	puts result.to_xml
else
 	result.to_csv
end
