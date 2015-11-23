module WordCounter
  require 'word_counter.rb'

  input_to_parse = ARGV[0]
  file_format = ARGV[1]

  text = ""

  if input_to_parse.start_with? "http://" or input_to_parse.start_with? "https://"
    WordCounter.parse_webpage(input_to_parse, file_format)
  elsif
    WordCounter.parse_file(input_to_parse, file_format)
  end
end
