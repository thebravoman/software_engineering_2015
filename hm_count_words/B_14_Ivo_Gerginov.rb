require './B_14_Ivo_Gerginov/word_counter'


f_path = ARGV[0]
op = ARGV[1]

w_counter = WordCounter.new()
res = w_counter.parse_file(f_path)

if op == 'json'
  res.to_json
  File.open('result.json', 'rb').each_line do |line|
  	puts line
  end
elsif op == 'xml'
  res.to_xml
  File.open('result.xml', 'rb').each_line do |line|
  	puts line
  end
else res.to_csv
  File.open('result.csv', 'r').each_line do |line|
  	puts line
  end
end

