require './result'

file_name = ARGV[0]
format = ARGV[1]

word_counter = WordCounter.new()
result = word_counter.parse_file file_name

case format
when 'json'
	result.to_json
when 'xml'
	result.to_xml
else
	result.to_csv
end