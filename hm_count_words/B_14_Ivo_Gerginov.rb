require './B_14_Ivo_Gerginov/word_counter'

f_path = ARGV[0]
op = ARGV[1]

if f_path.start_with?("http://", "https://") == true
  res = WordCounter::parseURL f_path
else res = WordCounter::parseFile f_path 
end

if op == 'json'
  res.to_json
  File.open('result.json', 'r').each_line do |line|
  	puts line
  end

elsif op == 'xml'
  res.to_xml
  File.open('result.xml', 'r').each_line do |line|
  	puts line
  end

else res.to_csv
  File.open('result.csv', 'r').each_line do |line|
  	puts line
  end

end

