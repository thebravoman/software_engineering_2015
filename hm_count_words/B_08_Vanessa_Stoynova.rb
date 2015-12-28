require 'word_counter'

filename = ARGV[0]
file_format = ARGV[1]

if filename.start_with?("https://") || filename.start_with?("http://")
	result = WordCounter.parse_webpage(filename)
elsif ARGV[0] == "-d"
	folder = ARGV[0]
	result = WordCounter.parse_folder(folder)
else
	result = WordCounter.parse_file(filename)
end

case file_format
	when 'json'
		puts result.to_json
	when 'xml'
		puts result.to_xml
	when 'svg'
		result.to_svg
	else
		puts result.to_csv
end
