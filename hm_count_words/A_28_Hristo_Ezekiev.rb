require 'word_counter'
filepath = ARGV[0]
def webb
	if( filepath.start_with?('http://') || filepath.start_with?('https://'))
		result = WordCounter.parse_webpage(filepath)
	else
		result = WordCounter.parse_file(filepath)
	end
end
webb
if ARGV[1] == 'json'
    puts result.to_json

elsif ARGV[1] == 'xml'
    puts result.to_xml
elsif ARGV[1] == "svg"
	puts coming soon...
else
    puts result.to_csv
end


