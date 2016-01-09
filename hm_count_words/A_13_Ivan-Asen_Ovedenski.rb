require 'word_counter' 
def site? url
	url.start_with?("http://") || url.start_with?("https://") 
end 

def get_result input 
	if site? input 
		WordCounter.parse_webpage input 
	else 
		WordCounter.parse_file input 
	end 
end 
	def print_result result, format 
		if format == 'json'
			result.to_json 
		elsif format == 'xml' 
			result.to_xml 
		else 
			result.to_csv 
		end 
		result.to_svg
	end 
if(ARGV[0] == '-d')
	path = ARGV[1]
	format = ARGV[2]
	temp = ""

	Dir.glob(folder + "/**/*").each do |file|
		temp += File.read(file)
	end

	print_result(WordCounter.parse(temp), format)
else
	parsed_input = ARGV[0]
	format = ARGV[1] 
	result = get_result parsed_input 

	print_result result, format
end