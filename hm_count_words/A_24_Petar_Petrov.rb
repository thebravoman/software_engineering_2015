require 'json'
require 'rexml/document'
require 'word_counter'

start = ARGV[0].split('/').first
if start == 'http:' || start == 'https:'
  result = WordCounter.parse_website(ARGV[0])
else
  result = WordCounter.parse_file(ARGV[0])
end

if ARGV[1] == 'json'
  result.to_json
elsif ARGV[1] == 'xml'
  result.to_xml
else
  result.to_csv
end
