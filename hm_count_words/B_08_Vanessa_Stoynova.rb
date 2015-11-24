require './B_08_Vanessa_Stoynova/word_counter.rb'

file = ARGV[0]
format = ARGV[1]

if(file.start_with?('https://') || file.start_with?('http://'))
	result = WordCounter.parsing_web_source file
  else if(file.include?(" "))
  	result = WordCounter.parse file
  else
    	result = WordCounter.parsing_the_file file
  end
end

if format == 'csv' || format == nil
	result.to_csv
elsif format == 'json'
	result.to_json
elsif format == 'xml'
	result.to_xml
end

