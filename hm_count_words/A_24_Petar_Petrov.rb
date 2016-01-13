require 'json'
require 'rexml/document'
require 'word_counter'

start = ARGV[0].split('/').first
if start == 'http:' || start == 'https:'
  result = WordCounter.parse_webpage(ARGV[0])
elsif ARGV[0] == '-d'
	result = WordCounter.parse_dir(ARGV[1]) 
else
  result = WordCounter.parse_file(ARGV[0])
end

if ARGV[1] == 'json'
  result.to_json
elsif ARGV[1] == 'xml'
  result.to_xml
elsif ARGV[1] == 'csv'
	result.to_csv
else
  result.to_csv
end
result.to_svg
result.to_db
