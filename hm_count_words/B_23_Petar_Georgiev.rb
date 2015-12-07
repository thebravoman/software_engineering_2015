require 'word_counter'

file_path = ARGV[0]
type = ARGV[1]

if (file_path.match('^https?:\/\/.+') || file_path.match('^http?:\/\/.+'))
  result = word_Count::web_parse(file_path)
else
  result = word_Count::file_parse(file_path)
end

if type == 'xml'
  puts result.to_xml
elsif type == 'json'
  puts result.to_json
else
  puts result.to_csv
end
