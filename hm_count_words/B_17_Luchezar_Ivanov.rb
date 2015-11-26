require './B_17_Luchezar_Ivanov/word_counter'
require 'uri'

@input = ARGV[0]
@format = ARGV[1]

if File.file? @input
	result = WordCounter::file_parse(@input)
elsif @input =~ /\A#{URI::regexp}\z/
	result = WordCounter::web_parse(@input)
end



case @format
when "json"
	File.open('result.json', 'w') {|json| json << result.to_json}
	puts result.to_json
when "xml"
	result.to_xml
when "svg"
	result.to_svg
else 
	File.open('result.csv', 'w') {|csv| csv << result.to_csv}
	puts result.to_csv
end
