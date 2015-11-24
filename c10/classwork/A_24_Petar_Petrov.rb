require 'json'
require 'rexml/document'
require 'word_counter'

result = WordCounter.parse_website(ARGV[0])

if ARGV[1] == 'json'
  result.to_json
elsif ARGV[1] == 'xml'
  result.to_xml
else
  result.to_csv
end
