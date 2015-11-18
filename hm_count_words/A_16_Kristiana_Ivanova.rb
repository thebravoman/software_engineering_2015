require 'rexml/document'
require 'json'
require './A_16_Kristiana_Ivanova/result'
require './A_16_Kristiana_Ivanova/word_counter'

word_counter = WordCounter.new
result = word_counter.parse_file ARGV[0]

if ARGV[1] == "json"
 result.to_json
elsif ARGV[1] == "xml"
 result.to_xml
else
 result.to_csv
end