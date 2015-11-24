require 'word_counter'

file_path = ARGV[0]
format = ARGV[1] == nil ? 'csv' : ARGV[1].downcase

if file_path.start_with?("http://", "https://")
  result = WordCounter.parse_webpage(file_path)
else
  result = WordCounter.parse_file(file_path)
end

case format
when 'json'
  puts result.to_json
when 'xml'
  puts result.to_xml
else
  puts result.to_csv
end
