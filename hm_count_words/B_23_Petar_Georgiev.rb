require './word_count.rb'

file_path = ARGV[0]

word_Count = Word_Count.new
result = word_Count.parse_file(file_path)

if ARGV[1] == 'xml'
  puts result.to_xml
elsif ARGV[1] == 'json'
  puts result.to_json
else
  puts result.to_csv
end
