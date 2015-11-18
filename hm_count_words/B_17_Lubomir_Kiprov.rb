require 'json'
require 'csv'
require 'rexml/document'
require '/home/lubo/Desktop/ruby/result.rb'
require '/home/lubo/Desktop/ruby/Word_counter.rb'


filename = ARGV[0]
format = ARGV[1]

result = WordCounter.new
word_counter = result.parse_file filename
if format == "json" 
	puts word_counter.to_json
elsif format == "xml"
	word_counter.to_xml
else 
	word_counter.to_csv	
end
