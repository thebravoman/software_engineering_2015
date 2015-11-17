require 'csv'
require 'json'
require 'rexml/document'
require './B_19_Martin_Angelov/result'
require './B_19_Martin_Angelov/word_counter'


result = (WordCounter.new).parse_file(ARGV[0])

if ARGV[1] == 'json'
	result.to_json
elsif ARGV[1] == 'xml'
	result.to_xml
else
	result.to_csv
end
