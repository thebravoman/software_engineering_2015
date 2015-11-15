require './A_15_Kalin_Karev/word_counter.rb'
require './A_15_Kalin_Karev/result.rb'

require 'json'
require 'csv'
require 'rexml/document'

file_name = ARGV[0].to_s
format = ARGV[1].to_s
words_hasedword_counter = WordCounter.new

answer = words_hasedword_counter.parse_file(file_name)

if format == "csv" || format == ""
	puts answer.to_csv
end

if format == "json"
	puts answer.to_json
end

if format == "xml"
	puts answer.to_xml
end
