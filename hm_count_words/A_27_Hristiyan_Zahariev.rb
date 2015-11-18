require 'csv'
require 'json'
require 'rexml/document'
require './A_27_Hristiyan_Zahariev/result.rb'
require './A_27_Hristiyan_Zahariev/word_counter.rb'

input_filename = ARGV[0]
output_option = ARGV[1]

words_counter = WordCounter.new
result = words_counter.parse_file ARGV[0]

if output_option == "json"
  result.to_json
elsif output_option == "xml"
  result.to_xml
else
  result.to_csv
end
