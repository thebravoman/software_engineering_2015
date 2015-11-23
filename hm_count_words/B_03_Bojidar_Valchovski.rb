#!/usr/bin/ruby
require './B_03_Bojidar_Valchovski/word_counter'

path = ARGV[0]
format = ARGV[1]

is_url = path.split("_").last.split("/").first

if (is_url == "https:") || (is_url == "http:") 
  result = WordCounter::parse_web path
else
  result = WordCounter::parse_file path
end

if format == "xml" 
  puts result.to_xml
elsif format == "json"
  puts result.to_json
else
  puts result.to_csv 
end
