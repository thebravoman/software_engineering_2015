require './B_14_Ivo_Gerginov/word_counter'

f_path = ARGV[0]
op = ARGV[1]

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

elsif op == 'svg'
  res.toSVG
  File.open('result.svg', 'r').each_line do |line|
    puts line
  end

else res.toCSV
  File.open('result.csv', 'r').each_line do |line|
  	puts line
  end

end

