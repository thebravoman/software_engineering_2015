require './B_22_Nikolay_Karagyozov/word_counter.rb'

path = ARGV[0]
format = ARGV[1]

word_counter = WordCounter.new
result = word_counter.parse_file(path)
output = ''
case format
when 'json'
  output = result.to_json
when 'xml'
  output = result.to_xml
else
  output = result.to_csv
end

puts output
File.open('result.csv', 'w') { |file| file << result.to_csv }
