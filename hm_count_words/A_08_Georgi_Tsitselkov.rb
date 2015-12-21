require_relative 'A_08_Georgi_Tsitselkov/word_counter'

filename = ARGV[0]
output = ARGV[1]

if filename.start_with?("http://", "https://") == true
	result = WordCounter::parse_webpage(filename)
else
	result = WordCounter::parse_file(filename)
end

if ARGV[1] == 'json'
  puts result.to_json
elsif ARGV[1] == 'xml'
  puts result.to_xml
else
  puts result.to_csv
end
