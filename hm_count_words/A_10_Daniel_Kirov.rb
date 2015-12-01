require 'json'
require 'rexml/document'
require './A_10_Daniel_Kirov/result'
require './A_10_Daniel_Kirov/word_counter'

file_path = ARGV[0]
res  = (WordCounter.new).parse_file(file_path)

if ARGV[1] == "json"
  res.to_json
elsif ARGV[1] == "xml"
  res.to_xml
else
  res.to_csv
end
