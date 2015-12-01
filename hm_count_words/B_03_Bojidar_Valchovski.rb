#!/usr/bin/ruby
require './B_03_Bojidar_Valchovski/word_counter'

path = ARGV[0]
format = ARGV[1]

is_url = path.start_with?("http://") || path.start_with?("https://")

if is_url
  result = WordCounter::parse_web path
else
  result = WordCounter::parse_file path
end

if format == "xml" 
  puts result.to_xml
  result.to_svg
elsif format == "json"
  puts result.to_json
  result.to_svg
elsif format == "svg"
  result.to_svg
else
  puts result.to_csv
  result.to_svg 
end
