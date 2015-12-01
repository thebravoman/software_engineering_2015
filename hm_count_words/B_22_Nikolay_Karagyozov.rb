require 'word_counter'

uri = ARGV[0]
format = ARGV[1]

result = ''
if uri.start_with?("http://") || uri.start_with?("https://")
  result = WordCounter.parse_webpage(uri)
else
  result = WordCounter.parse_file(uri)
end

output = ''
case format
when 'json'
  output = result.to_json
  puts output
when 'xml'
  output = result.to_xml
  puts output
when 'svg'
  output = result.to_svg
else
  output = result.to_csv
end
