require 'json'
require 'rexml/document'
require './A_6_Victoria_Admasu/word_counter.rb'
require './A_6_Victoria_Admasu/word_counter/result.rb'

name = ARGV[0]
type = ARGV[1]
$marks = 0
$count = Hash.new

p1 = name.split('/').first

if p1 == 'http:' || p1 == 'https:'
  result = WordCounter.parse_web(name)
else 
  result = WordCounter.parse_file(name)
elsif 
  result = Parser.parse(name)
end

if type == 'json'
  result.to_json
elsif type == 'csv' or type == nil
  result.to_csv
elsif type == 'xml'
  result.to_xml
elsif type == 'svg'
  result.to_svg
end
