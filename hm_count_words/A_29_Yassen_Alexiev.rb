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

input = ARGV[0]
format = ARGV[1]
result = get_result(input)
