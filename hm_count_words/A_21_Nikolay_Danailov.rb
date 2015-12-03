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

def write_to_file(file, data)
  File.open(file, 'w') do |f|
    f << data
  end
end

def print_result(result, format)
  if format == 'json'
    puts result.to_json
  elsif format == 'xml'
    puts result.to_xml
  elsif format == 'csv'
    puts result.to_csv
  else
    svg = result.to_svg
    write_to_file('A_21_Nikolay_Danailov.svg', svg)
  end
end

input = ARGV[0]
output_format = ARGV[1]
result = get_result input
print_result result, output_format
