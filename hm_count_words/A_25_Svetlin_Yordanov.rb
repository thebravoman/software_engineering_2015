require 'csv'
require 'json'
require 'rexml/document'
require './A_5_Velin_Yavorski/word_counter.rb'
require './A_5_Velin_Yavorski/result.rb'

filepath = ARGV[0]
format = ARGV[1]


word_counter = WordCounter.new
result = word_counter.parse_file(filepath)
if(format == "json")
  puts result.to_json
elsif(format == "xml")
  puts result.to_xml
else
  result.to_csv
end