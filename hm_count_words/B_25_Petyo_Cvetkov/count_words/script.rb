
require "./write.rb"
require "./Count_words.rb"
file_name = ARGV[0]
format = ARGV[1]
word_counter = WordCounter.new
word_counter = word_counter.parse_file file_name

if format == "json"
  puts word_counter.to_json
elsif format == "xml"
  puts word_counter.to_xml
else
  puts word_counter.to_csv
end
