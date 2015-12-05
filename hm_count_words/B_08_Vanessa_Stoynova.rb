require './B_08Vanessa_Stoynova/word_counter'

file = ARGV[0]
file_format = ARGV[1]

if file.start_with?('https://') || file.start_with?('http://')
  	result = WordCounter.parse_webpage(file)
  else
    	result = WordCounter.parse_file(file)
end

case format
	when 'json'
  		puts result.to_json
	when 'xml'
  		puts result.to_xml
	when 'svg'
  		result.to_svg
	else
  		puts result.to_csv
end

