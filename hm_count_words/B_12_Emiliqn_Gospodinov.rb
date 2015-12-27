require_relative 'B_12_Emiliqn_Gospodinov/word_counter.rb'

words = ARGV[0]

if(words.start_with?('https://') || words.start_with?('http://'))
	result = WordCounter.parsing_web_source words
	else if(words.include?(" "))
	result = WordCounter.parse words
	else
		result = WordCounter.parsing_the_file words
	end
end

if ARGV[1] == 'csv' or ARGV[1] == nil
	result.to_csv
elsif ARGV[1] == 'json'
	result.to_json
elsif ARGV[1] == 'xml'
	result.to_xml
end
