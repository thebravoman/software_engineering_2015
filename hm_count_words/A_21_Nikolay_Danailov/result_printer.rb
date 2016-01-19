require 'sqlite3'
require 'word_counter/result'
require_relative './db_utils.rb'

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
  else
    puts result.to_csv
  end
  
  write_to_file 'A_21_Nikolay_Danailov.svg', result.to_svg
end