require './B_15_Yordan_Yankulov/result.rb'
require './B_15_Yordan_Yankulov/word_counter.rb'
require 'json'
require 'rexml/document'

file_name = ARGV[0]
format_of_output = ARGV[1]
word_counter = WordCounter.new
result = word_counter.parse_file file_name

if format_of_output == 'json'
  puts result.to_json
elsif format_of_output == 'xml'
  result.to_xml
else
  puts result.to_csv
end
