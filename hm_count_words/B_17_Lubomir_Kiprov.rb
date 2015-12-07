require_relative '/Word_counter.rb'


filename = ARGV[0]
format = ARGV[1]

if( filename.start_with?('http://') || filename.start_with?('https://'))
	result = Word_counter.parse(filename)
else
	result = Word_counter.parse_file(filename)
end
result.make_svg
if format == "json" 
	puts result.to_json
elsif format == "xml"
	result.to_xml
else 
	result.to_csv	
end
