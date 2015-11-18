require './B_08_Vanessa_Stoynova/word_counter.rb'

file = ARGV[0]
format = ARGV[1]

counter = WordCounter.new
result = counter.parse_file(file)

if format == 'csv' || format == nil
	result.to_csv
elsif format == 'json'
	result.to_json
elsif format == 'xml'
	result.to_xml
end

