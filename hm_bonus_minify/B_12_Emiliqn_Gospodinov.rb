require 'csv'
require 'rexml/document'

file_for_reading = CSV.read ARGV[0]

description = ARGV[1]
value = ARGV[2]

sum = 0
line_holder = []
sum_checker = 0

case 
	when value == nil
		file_for_reading.each do |column|
			if column[0] == description.to_s
				puts column.join(",")
			end
			
			if column[1] == description.to_s or description.to_s == 'xml'
				sum = sum + column[3].to_i
				line_holder << column
				sum_checker = 1
			end
		end
	
	when value != nil
		file_for_reading.each do |column|
			if column[0] == description.to_s and column[3].to_i >= value.to_i - 10 and column[3].to_i <= value.to_i + 10
				puts column.join(",")
			end
		end
end

line_holder.sort! {|a, b| [a[1].to_s, a[0].to_s, a[3].to_i] <=> [b[1].to_s, b[0].to_s, b[3].to_i] }

if description.to_s != 'xml'

	line_holder.each do |element|
		puts element.join(",")
	end

	if value == nil and sum_checker == 1
		puts sum
	end

elsif description.to_s == 'xml'
	my_xml = REXML::Document.new('')
	minify = my_xml.add_element('minify')

	line_holder.each do |element|
		account = minify.add_element("#{element[1]}")
		date = account.add_element("#{element[0]}")
		amount = date.add_element("amount").add_text("#{element[3]}")
	end

	out = ""
	my_xml.write(out, 1)
	puts out
end
