require_relative './A_16_Kristiana_Ivanova/word_counter'
require 'builder'

def uri?(string)
	start = string.split('/').first
  	start == 'http:' || start == 'https:'
end

def get_result(filename)
  if File.file? filename
    WordCounter.parse_file filename
  elsif uri? filename
    WordCounter.parse_webpage filename
  else
    WordCounter.parse filename
  end
end

if format == 'json'
 puts result.to_json
elsif format == 'xml'
 puts result.to_xml
else
 puts result.to_csv
end

filename = ARGV[0]
format = ARGV[1]
