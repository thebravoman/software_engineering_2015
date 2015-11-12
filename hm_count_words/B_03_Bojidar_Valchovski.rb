#!/usr/bin/ruby
require './B_03_Bojidar_Valchovski/word_counter.rb'

path = ARGV[0]
format = ARGV[1]

wc = WordCounter.new
#result = wc.parse_file(path)
result = wc.parse("This is an a a a, example sentence!")
if format == "xml"
  puts result.to_xml
elsif format == "json"
  puts result.to_json
else
  puts result.to_csv
end
