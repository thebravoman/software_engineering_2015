require 'csv'
require 'json'
require 'rexml/document'
require './A_14_Ignat_Georgiev/result.rb'
require './A_14_Ignat_Georgiev/word_counter.rb'
command = ARGV[1]
word_counter = WordCounter.new
result = word_counter.parse_file ARGV[0]
if command == "json"
 puts result.to_json
elsif command == "xml"
 puts result.to_xml
else
 result.to_csv
end
