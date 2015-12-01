require './B_08_Vanessa_Stoynova/word_counter.rb'

file = ARGV[0]
file_format = ARGV[1]

if(file.start_with?('https://') || file.start_with?('http://'))
	result = WordCounter.parsing_web_source file
  else if(file.include?(" "))
  	result = WordCounter.parse file
  else
    	result = WordCounter.parse_the_file file
  end
end

if file_format == 'csv' || file_format == nil
	result.to_csv
elsif file_format == 'json'
	result.to_json
elsif file_format == 'xml'
	result.to_xml
end

