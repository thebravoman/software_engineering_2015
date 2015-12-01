require_relative './B_02_Atanas_Chompolov/word_counter'


def ifLink(filename)
	first = filename.split('/').first
	return first == 'http:' || first == 'https:'
end

file_name = ARGV[0].to_s
output_format = ARGV[1].to_s
format = "string"

if File.file? file_name
	format = "file"
elsif ifLink file_name
 	format= "url"
end 


if format == "file"
	result = WordCounter.parse_file file_name
elsif format == "url"
	result = WordCounter.parse_webpage file_name
elsif format == "string"
	result = WordCounter.parse file_name
end

if output_format=="csv" or output_format == ""
	puts result.to_csv
elsif output_format=="json"
	puts result.to_json
elsif output_format=="xml" 
	puts result.to_xml
elsif output_format=="svg" 
	puts result.to_svg
end
