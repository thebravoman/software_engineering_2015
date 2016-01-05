require_relative 'B_14_Ivo_Gerginov/word_counter'


if ARGV[0] == '-d'
  fPath = ARGV[1]
  op = ARGV[2]
  result = WordCounter::parseFolder(fPath)
else
  fPath = ARGV[0]
  op = ARGV[1]
end

if f_path.start_with?("http://", "https://") == true
  res = WordCounter::parseURL f_path
else res = WordCounter::parseFile f_path 
end

if op == 'json'
  res.toJSON
  File.open('result.json', 'r').each_line do |line|
  	puts line
  end

elsif op == 'xml'
  res.toXML
  File.open('result.xml', 'r').each_line do |line|
  	puts line
  end

else res.toCSV
  File.open('result.csv', 'r').each_line do |line|
  	puts line
  end

end

res.toSVG