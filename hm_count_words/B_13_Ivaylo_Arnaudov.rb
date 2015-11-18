require './B_13_Ivaylo_Arnaudov/word_counter'

file_path = ARGV[0]
format = ARGV[1] == nil ? 'csv' : ARGV[1].downcase

word_counter = WordCounter.new
result = word_counter.parse_file(file_path)

case format
when 'json'
  puts result.to_json
when 'xml'
  puts result.to_xml
else
  puts result.to_csv
end
