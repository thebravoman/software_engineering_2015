require_relative 'B_12_Emiliqn_Gospodinov/word_counter'
format = ARGV[1]

is_url = ARGV[0].split("_").last.split("/").first

if (is_url == "https:") || (is_url == "http:") 
  result = WordCounter::parse_web(ARGV[0])
else
  result = WordCounter::parse_file(ARGV[0])
end

if format == "json"
  puts result.to_json
elsif format == "xml"
  puts result.to_xml
elsif format == "csv" or format == nil
  puts result.to_csv
end
