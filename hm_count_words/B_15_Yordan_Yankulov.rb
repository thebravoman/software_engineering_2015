require_relative 'B_15_Yordan_Yankulov/word_counter'

file_name = ARGV[0]
format_of_output = ARGV[1]

if file_name.start_with?('https://') || file_name.start_with?('http://')
  result = WordCounter::parse_webpage(file_name)
else
  result = WordCounter::parse_file(file_name)
end

if format_of_output == 'json'
  result.to_json
elsif format_of_output == 'xml'
  result.to_xml
else
  result.to_csv
end
