
require_relative './B_04_Bojidar_Zahov/V4/word_counter'
#require_relative'./B_04_Bojidar_Zahov/word_counter'
result = WordCounter.new.parse_file File.open(ARGV[0], "r")
output = ARGV[1]
case output
  	when "json"
    	File.open('result.json', 'w') {|json| json << result.to_json}	
		to_json
		to_svg
	when "xml"
		result.to_xml
		to_svg
	#when "all"
		#File.open('result.json', 'w') {|json| json << result.to_json}
		#to_json
		#result.to_xml
		#File.open('result.csv', 'w') {|csv| csv << result.to_csv}
		#puts result.to_csv
	else
		to_svg
		File.open('result.csv', 'w') {|csv| csv << result.to_csv}
		puts result.to_csv
end
