module WordCounter
  require './B_27_Radostin_Angelov/word_counter.rb'
  require './B_27_Radostin_Angelov/result.rb'

  input_to_parse = ARGV[0]
  file_format = ARGV[1]

  result = Result.new

  text = ""

  if input_to_parse.start_with? "http://" or input_to_parse.start_with? "https://"
     text = WordCounter.parse_webpage(input_to_parse)
  elsif
    text = WordCounter.parse_file(input_to_parse)
  end

  result.word_counts(text)
  result.marks_count(text)

  case file_format
    when "json"
      result.to_json
    when "xml"
      result.to_xml
    else
      result.to_csv
  end
end
