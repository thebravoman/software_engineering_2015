require './B_26_Plamen_Neshkov/word_counter.rb'

filepath = ARGV[0]
format = ARGV[1]

word_counter = WordCounter.new
result = word_counter.parse_file(filepath)

if format == 'json'
  File.open('result.json', 'w') { |file| file << result.to_json }
  puts result.to_json
elsif format == 'xml'
  File.open('result.xml', 'w') { |file| file << result.to_xml }
  puts result.to_xml
else
  File.open('result.csv', 'w') { |file| file << result.to_csv }
  puts result.to_csv
end
