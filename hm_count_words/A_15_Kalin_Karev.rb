require_relative './A_15_Kalin_Karev/word_counter'

file_name = ARGV[0].to_s
format_print = ARGV[1].to_s
format = "string"

def ifSite(filename)
	first = filename.split('/').first
	return first == 'http:' || first == 'https:'
end

if File.file? file_name
	format = "file"
end

if ifSite file_name 
	format = "url"
end

if format == "file" 
	answer = WordCounter.parse_file file_name
end

if format == "url"
	answer = WordCounter.parse_webpage file_name 
end

if format == "string"
	answer = WordCounter.parse file_name
end

if format_print == "csv" || format == ""
	puts answer.to_csv
end

if format_print == "json"
	puts answer.to_json
end

if format_print == "xml"
	puts answer.to_xml
end

if format_print == "svg"
	puts anwer.to_svg
end
