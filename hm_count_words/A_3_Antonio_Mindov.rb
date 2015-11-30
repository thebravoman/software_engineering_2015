require 'word_counter'

def site? str
	str.start_with?("http://") || str.start_with?("https://")
end

def get_result input
	if site? input
		WordCounter.parse_webpage input
	else
		WordCounter.parse_file input
	end
end

def print_result result, format
	if format == 'json'
		puts result.to_json
	elsif format == 'xml'
		puts result.to_xml
	else
		puts result.to_csv
	end
end

parseInput = ARGV[0]
format = ARGV[1]
result = get_result parseInput

print_result result, format
