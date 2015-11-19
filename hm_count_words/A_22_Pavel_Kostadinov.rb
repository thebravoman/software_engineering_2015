require 'json'
require 'rexml/document'
require './A_22_Pavel_Kostadinov/result'
require './A_22_Pavel_Kostadinov/words_count'

xml_json = ARGV[1]



word_counter = WordCounter.new
result = word_counter.parse_file ARGV[0]
 
if xml_json == 'json'
  puts result.to_json


elsif xml_json == 'xml'
  puts result.to_xml

else
  puts result.to_csv
end
	
