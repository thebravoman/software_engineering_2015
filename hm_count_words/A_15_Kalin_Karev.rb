require_relative './A_15_Kalin_Karev/word_counter'

file_name = ARGV[0]
format_print = ARGV[1]
#format = "string"


if( file_name.start_with?('http://') || file_name.start_with?('https://'))
	answer = WordCounter.parse_webpage(file_name)
elsif File.file? file_name
	answer = WordCounter.parse_file(file_name)
else
	answer = WordCounter.parse file_name 
end

if format_print == "csv"
	puts answer.to_csv
end

if format_print == "json"
	puts answer.to_json
end

if format_print == "xml"
	puts answer.to_xml
end
answer.make_svg
