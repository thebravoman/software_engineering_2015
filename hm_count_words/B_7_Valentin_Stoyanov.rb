require './B_7_Valentin_Stoyanov/word_counter'
require 'uri'

@input = ARGV[0]
@format = ARGV[1]
dir = false

if File.file? @input
	result = WordCounter::file_parse(@input)
elsif @input =~ /\A#{URI::regexp}\z/
		result = WordCounter::web_parse(@input)
	elsif @input == '-d' and File.directory? @format
		dir = true
		result = WordCounter::dir_parse(@format)
		result.to_csv
	end

unless dir
	case @format
	when 'json'
		result.to_json
	when 'xml'
		result.to_xml
	else
		result.to_csv
	end
end

WordCounter::SVGenerator.draw result.word_counts, result.marks_count



