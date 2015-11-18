require 'json'
require 'rexml/document'
require './A_13_Ivan-Asen_Ovedenski/word_counter.rb'
require './A_13_Ivan-Asen_Ovedenski/results.rb'


result = (WordCounter.new).parse_file(ARGV[0])
#result.parse_file(ARGV[0])

if ARGV[1] == 'json'
	result.get_json
elsif ARGV[1] == 'xml'
	 result.get_xml
else 
	result.get_csv
end
