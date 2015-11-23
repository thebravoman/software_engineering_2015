require './B_28_Toma_Marinov/word_counter/result'

file_name = ARGV[0]
format = ARGV[1]

if file_name.match(%r{\Ahttps://})
	result = WordCounter::parse_web(file_name)
else
	result = WordCounter::parse_file(file_name)
	#result = word_counter.parse_file file_name
end

case format
when 'json'
	result.to_json
when 'xml'
	result.to_xml
else
	result.to_csv
end