require "rexml/document"

csv_file = ARGV[0]
argument1 = ARGV[1].to_s
value = ARGV[2]

csv_data = File.open(csv_file, 'r')
output = Array.new
date_format = /\d{2}\/\d{2}\/\d{4}/

if value == nil and date_format.match(argument1) != nil
	csv_data.each do |row|
		row = row.split(',')
		if row.first.to_s == argument1 
			puts row.join(',')
		end
	end
elsif value != nil and date_format.match(argument1) != nil
	value = value.to_i
	csv_data.each do |row|
		row = row.split(',')
		if (row.first.to_s == argument1) and (row[3].to_i.between?(value-10, value+10))
			puts row.join(',')
		end
	end
elsif value == nil and date_format.match(argument1) == nil and argument1 != "xml"
	sum = 0	
	csv_data.each do |row|
		row = row.split(',')
		if (row[1].to_s == argument1)
			sum = sum+row[3].to_i
			output << row.join(',')
		end
	end
	puts output.sort!
	puts sum
elsif value == nil and date_format.match(argument1) == nil and argument1 == "xml"
#	xml_data = REXML::Documents.new('')
#	minify_blok = xml_data.add_element('minify')
	
	
end



