require_relative 'B_14_Ivo_Gerginov/word_counter'
require 'byebug'

if ARGV[0] == '-d'
  fPath = ARGV[1]
  op = ARGV[2]
  result = WordCounter::parseFolder(fPath)
else
  fPath = ARGV[0]
  op = ARGV[1]
end

if fPath.start_with?("http://", "https://") == true
  res = WordCounter::parseURL fPath
else res = WordCounter::parseFile fPath 
end
byebug
if op == 'json'
  res.toJSON
elsif op == 'xml'
  res.toXML
else 
  res.toCSV
end

res.toSVG