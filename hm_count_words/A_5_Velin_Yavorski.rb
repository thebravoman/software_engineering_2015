require 'word_counter'

filepath = ARGV[0]
format = ARGV[1]


if( filepath.start_with?('http://') || filepath.start_with?('https://'))
	result = WordCounter.parse_webpage(filepath)
else
	result = WordCounter.parse_file(filepath)
end

if(format == "json")
  puts result.to_json
elsif(format == "xml")
  puts result.to_xml
else
  result.to_csv
end
