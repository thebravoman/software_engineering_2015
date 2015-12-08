require 'word_counter'

def uri?(string)
  beginning = string.split('/').first
  beginning == 'http:' || beginning == 'https:'
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
    write_to_file('A_29_Yassen_Alexiev.svg', svg)
  end
end

input = ARGV[0]
format = ARGV[1]
result = get_result(input)
print_result result, output_format