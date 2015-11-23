require 'word_counter'

def uri?(string)
  start = string.split('/').first
  start == 'http:' || start == 'https:'
end

def get_result(input)
  if File.file? input
    WordCounter.parse_file input
  elsif uri? input
    WordCounter.parse_webpage input
  else
    WordCounter.parse input
  end
end

def print_result(result, format)
  if format == 'json'
    puts result.to_json
  elsif format == 'xml'
    puts result.to_xml
  else
    puts result.to_csv
  end
end

input = ARGV[0]
output_format = ARGV[1]
result = get_result input
print_result result, output_format
