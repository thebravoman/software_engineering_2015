require 'csv'
require 'json'
require 'builder'
require 'rexml/document'
require './A_12_Emil_Lozev/result'
require './A_12_Emil_Lozev/word_counter'

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
