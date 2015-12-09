module WordCounter
  require 'word_counter.rb'

  input_to_parse = ARGV[0]
  file_format = ARGV[1]

  text = ""

  if input_to_parse.start_with? "http://" or input_to_parse.start_with? "https://"
    result = WordCounter.parse_webpage(input_to_parse)
  elsif
    result = WordCounter.parse_file(input_to_parse)
  end
  
  result.to_svg
  case file_format
    when "json"
      result.to_json
    when "xml"
      result.to_xml
    when "svg"
      result.to_svg
    else
      result.to_csv
  end
end