require './B_22_Nikolay_Karagyozov/word_counter.rb'

path = ARGV[0]
format = ARGV[1]

word_counter = WordCounter.new
result = word_counter.parse_file(path)

case format
when 'json'
  File.open('result.json', 'w') { |file| file << result.to_json }
when 'xml'
  File.open('result.xml', 'w') { |file| file << result.to_xml }
else
  File.open('result.csv', 'w') { |file| file << result.to_csv }
end
