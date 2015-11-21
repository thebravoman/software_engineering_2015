require 'word_counter'

def is_uri string
  start = string.split('/').first
  start == 'http:' || start == 'https:'
end

def get_result input
  if File.file? input
    result = WordCounter.parse_file input
  elsif is_uri input
    result = WordCounter.parse_webpage input
  else
    result = Parser.parse input
  end
end

def print_result result, format
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
