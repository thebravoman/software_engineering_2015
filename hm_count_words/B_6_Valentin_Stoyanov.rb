require './B_6_Valentin_Stoyanov/word_counter'

@format = ARGV[1]
@file = File.open(ARGV[0], "r")

word_counter = WordCounter.new
result = word_counter.parse_file @file

case @format
when "json"
	puts result.to_json
when "xml"
	result.to_xml
else 
	puts result.to_csv
end
