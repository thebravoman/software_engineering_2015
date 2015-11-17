require 'json'
require 'rexml/document'
require './word_counter'
require './result'

result = WordCounter.new.parse_file(ARGV[0])
output = ARGV[1]
case output
     when "json" 
     	puts result.to_json
     when "xml"
     	puts result.to_xml
     #when "all"
     	#puts result.to_json
     	#puts result.to_xml
     	#puts result.to_csv
     else 
     	puts result.to_csv
end
