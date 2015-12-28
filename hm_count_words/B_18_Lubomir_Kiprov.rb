require_relative 'B_18_Lubomir_Kiprov/Word_counter.rb'

$result1 = ""
def recursive_count(dir)
	result = ''
	Dir.glob(dir + '*').each do |s| 
		if File.directory?(s + '/')
			recursive_count(s + '/')
		else
			result = Word_counter.parse_file(s)		
			$result1 = result.to_csv(true)
		end
	end
end


filename = ARGV[0]
format = ARGV[1]


if( filename.start_with?('http://') || filename.start_with?('https://'))
	result = Word_counter.parse_web(filename)
else
	
	if ARGV[0] == "-d" 
		recursive_count(format)
		result = Word_counter.parse($result1)
	else
		result = Word_counter.parse_file(filename)
	end


end
result.make_svg

if format == "json" 
	puts result.to_json
elsif format == "xml"
	result.to_xml
else 
	result.to_csv(false)	
end
