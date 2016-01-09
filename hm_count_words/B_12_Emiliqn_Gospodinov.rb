require_relative 'B_12_Emiliqn_Gospodinov/word_counter.rb'

words = ARGV[0]
a = 1

if words == '-d'
	a = a + 1
	result = WordCounter.parse_a_folder ARGV[1]
else 
	if words.start_with?('https://') or words.start_with?('http://')
		result = WordCounter.parsing_web_page words
		if(words.include?(" "))
			result = WordCounter.parse words
		else
			result = WordCounter.parsing_the_file words
		end
	end
end

if a == 1
	if ARGV[1] == 'csv' or ARGV[1] == nil
		result.to_csv
	elsif ARGV[1] == 'json'
		result.to_json
	elsif ARGV[1] == 'xml'
		result.to_xml
	end
end
