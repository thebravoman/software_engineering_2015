require_relative 'B_09_Georgi_Stoilov/word_counter.rb'

file = ARGV[0]
format = ARGV[1]

if(file.include?("http://") || file.include?("https://"))
  result = WordCounter.parsing_web_source file
  else if(file.include?(" "))
    result = WordCounter.parse file
  else
    result = WordCounter.parsing_the_file file
  end
end

if format == 'csv' || format == nil
  result.to_csv
  else
  if format == 'json'
    result.to_json
    else
    if format == 'xml'
      result.to_xml
    end
  end
end
