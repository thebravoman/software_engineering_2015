#!/usr/bin/ruby
require_relative 'B_03_Bojidar_Valchovski/word_counter.rb'

if ARGV[0] == "-d"
  path = ARGV[1]
  result = WordCounter::parse_folder(path)
  puts result.to_csv
else
  path = ARGV[0]
  format = ARGV[1]

  is_url = path.start_with?("http://") || path.start_with?("https://")

  if is_url
    result = WordCounter::parse_web path
  else
    result = WordCounter::parse_file path
  end

  if format == "xml" 
    puts result.to_xml
  elsif format == "json"
    puts result.to_json
  else
    puts result.to_csv
  end
  result.to_db
  result.to_svg

end
