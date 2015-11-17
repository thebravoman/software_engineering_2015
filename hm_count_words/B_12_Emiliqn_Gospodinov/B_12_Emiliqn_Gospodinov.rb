require './Result.rb'
require './WordCounter.rb'

format = ARGV[1]

word_counter = WordCounter.new
result = word_counter.parse_file "kva"

if format == "json"
  puts result.to_json
elsif format == "xml"
  puts result.to_xml
elsif format == "csv" or format == nil
  puts result.to_csv
end
