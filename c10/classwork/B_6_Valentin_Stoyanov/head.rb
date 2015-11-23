require 'json'
require 'rexml/document'
require 'csv'
require './word_counter'

@format = ARGV[1]
@file = File.open(ARGV[0], "r")

word_counter = WordCounter.new
result = word_counter.parse_file @file

case @format
when "json"
	File.open('result.json', 'w') {|json| json << result.to_json}
	puts result.to_json
when "xml"
	result.to_xml
when "http"
#
else 
	File.open('result.csv', 'w') {|csv| csv << result.to_csv}
	puts result.to_csv
end
