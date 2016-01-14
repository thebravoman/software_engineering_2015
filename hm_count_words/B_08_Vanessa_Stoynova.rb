require 'word_counter'

filename = ARGV[0]

if filename.start_with?("https://") || filename.start_with?("http://")
	result = WordCounter.parse_webpage(filename)
	file_format = ARGV[1]
elsif ARGV[0] == "-d"
	folder = ARGV[1]
	file_format = ARGV[2]
	result = WordCounter.parse_folder(folder)
else
	result = WordCounter.parse_file(filename)
	file_format = ARGV[1]
end

result.to_svg

case file_format
	when 'json'
		puts result.to_json
	when 'xml'
		puts result.to_xml
	else
		puts result.to_csv
end
