require 'word_counter'

input = ARGV[0]
format = ARGV[1]


if( input.start_with?('http://') || input.start_with?('https://'))
	result = WordCounter.parse_webpage(input)
elsif File.file? input
	result = WordCounter.parse_file(input)
else
	result = WordCounter.parse input
end

if(format == "json")
  puts result.to_json
elsif(format == "xml")
  puts result.to_xml
else
  result.to_csv
end
result.make_svg
