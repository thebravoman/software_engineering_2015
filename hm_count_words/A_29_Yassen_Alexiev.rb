require 'word_counter'

input_file = ARGV[0].to_s
format = ARGV[1].to_s
word_counter = WordCounter.new
result = word_counter.parse_file(input_file)

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

def print_result(result, format)
  if format=="csv" or format == ""
	puts result.to_csv
  end
  if format=="json"
	puts result.to_json
  end
  if format=="xml" 
	puts result.to_xml
  end
end