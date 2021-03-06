require './B_25_Petyo_Cvetkov/CountWords.rb'

if ARGV[0] == "-d"
  path = ARGV[1]
  format = ARGV[2]
else
  path  = ARGV[0]
  format = ARGV[1]
end
result = WordCounter::get_cached path
if result.nil?
  if path == "-d"
    result = WordCounter::parse_dir format
  else
    if (path.match('^https?:\/\/.+'))
      result = WordCounter::parse_webpage(path)
    else
      result = WordCounter::parse_file(path)
    end
  end
end

  WordCounter::Draw_graph::draw_graph(result.word_counts,result.marks_count)


if format == 'json'
  File.open('result.json', 'w') { |file| file << result.to_json }
  puts result.to_json
elsif format == 'xml'
  File.open('result.xml', 'w') { |file| file << result.to_xml }
  puts result.to_xml
else
  File.open('result.csv', 'w') { |file| file << result.to_csv }
end
