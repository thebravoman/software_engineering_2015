require_relative 'B_12_Emiliqn_Gospodinov/word_counter.rb'

word = ARGV[0]

if words == '-d'
	a = a + 1
	result = WordCounter.parse_a_folder ARGV[1]
	else if words.start_with?('https://') or words.start_with?('http://')
		result = WordCounter.parsing_web_page words	
	end
end
if words != '-d'
	if(words.include?(" "))
		result = WordCounter.parse words
	else
		result = WordCounter.parsing_the_file words
end

if a == 1
	if ARGV[] == 'csv' or ARGV[a] == nil
		result.to_csv
	elsif ARGV[a] == 'json'
		result.to_json
	elsif ARGV[a] == 'xml'
		result.t_xml
	end
end
