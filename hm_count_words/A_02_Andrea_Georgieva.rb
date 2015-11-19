require 'json'
require 'rexml/document'
require './A_02_Andrea_Georgieva/word_counter'
require './A_02_Andrea_Georgieva/result'

word_counter = WordCounter.new
res = word_counter.parse_file ARGV[0]

if ARGV[1] == "csv"
 result.to_csv
elsif ARGV[1] == "json"
 result.to_json
elsif ARGV[1] == "xml"
 result.to_xml
end
