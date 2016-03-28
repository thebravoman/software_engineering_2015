require 'word_counter'
require 'optparse'

folder = ''
OptionParser.new do |opt|
  opt.on('-d', '-d directory_name', 'The name of the directory') { |o| folder = o}
end.parse!

format = ARGV[1] == nil ? 'csv' : ARGV[1].downcase

if folder == ''
  file_path = ARGV[0]

  if file_path.start_with?("http://", "https://")
    result = WordCounter.parse_webpage(file_path)
  else
    result = WordCounter.parse_file(file_path)
  end
else
  result = WordCounter.parse_directory(folder)
end

case format
when 'json'
  puts result.to_json
when 'xml'
  puts result.to_xml
when 'svg'
  result.to_svg
else
  puts result.to_csv
end
result.to_svg
