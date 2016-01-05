require 'word_counter'

is_folder = false
ARGV.each { |arg| is_folder = true if arg == "-d" }

uri = ARGV[is_folder ? 1 : 0]
format = ARGV[is_folder ? 2 : 1]

result = ''
if (is_folder)
  folder = ARGV[1]
  result = WordCounter.parse_folder(folder)
elsif uri.start_with?("http://") || uri.start_with?("https://")
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
