require_relative './A_15_Kalin_Karev/word_counter'

filename = ARGV[0]
format = ARGV[1]
#words_hasedword_counter = WordCounter.new

if (filename.start_with?('http://') || filename.start_with?('https://'))
	answer = WordCounter.parse_webpage(filename)
else
	answer = WordCounter.parse_file(filename)

end

#answer = words_hasedword_counter.parse_file(file_name)

if format == "csv" || format == ""
	puts answer.to_csv
end

if format == "json"
	puts answer.to_json
end

if format == "xml"
	puts answer.to_xml
end
