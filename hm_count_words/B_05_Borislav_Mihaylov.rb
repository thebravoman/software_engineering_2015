require 'csv'
require 'json'
require 'rexml/document'
require './B_05_Borislav_mihaylov/result'
require './B_05_Borislav_Mihaylov/word_counter'


word_counter = WordCounter.new
result = word_counter.parse_file filename

if output == 'json'
  puts result.to_json
elsif output == 'xml'
  puts result.to_xml
else
  puts result.to_csv
end
