require 'csv'
require 'rexml/document'

def chek_range_of_amount (value, line, date_or_not)
	date = date_or_not.split("/").size
	if date > 1
		if (line.split(',')[3].to_i > value.to_i - 10 and line.split(',')[3].to_i < value.to_i + 10) || ARGV.size == 2
			print_line(line)
		end
	else if date == 1
			if (line.split(',')[3].to_i == date_or_not.to_i)
				$sum += line.split(',')[3].to_i
				print_line(line	)
			end
		end
	end
end

def print_line (line)
	$arr << line

end


def print_xml file 

xml= REXML::Document.new()
minify = xml.add_element('minify')
acc = minify
arr = Array.new
File.open(file, "r") do |row|
	row.each do |line|
		arr << line
	end
end
hash = {}
datearr = Array.new
counter = 0
arr.sort! { |a, b| (a.split(',')[1].to_s <=> b.split(',')[1].to_s)}
arr.each do |ar|
	if counter > 0	
		if arr[counter].split(',')[1] == arr[counter - 1].split(',')[1] 
			if arr[counter].split(',')[0] != arr[counter - 1].split(',')[0] 
				$date = acc.add_element('date')	
				$amount = $date.add_element("amount")
				$amount.add_text arr[counter].split(',')[3]
			else
				if arr[counter].split(',')[3] != arr[counter - 1].split(',')[3] 
					$amount = $date.add_element("amount")
					$amount.add_text arr[counter].split(',')[3]
				end
			end
		else	
			acc = minify.add_element('account')
			$date = acc.add_element('date')	
			$amount = $date.add_element("amount")
			$amount.add_text arr[counter].split(',')[3]
		end
	else
		acc = minify.add_element('account')
		$date = acc.add_element('date')	
		$amount = $date.add_element("amount")
		$amount.add_text arr[counter].split(',')[3]
	end
	counter += 1
end


output = REXML::Formatters::Pretty.new
output.compact = true
output.write(xml, $stdout)
puts

end



filename = ARGV[0]
searching_date = ARGV[1]
if searching_date.to_s != "xml"
	$sum = 0
	$arr = Array.new
	File.open(filename, "r") do |row|
		row.each do |line|
			if line.include? searching_date
				chek_range_of_amount ARGV[2], line, ARGV[1]
			end
		end
	end
	$arr.sort! { |a, b| Date.parse(a.split(',')[0]) <=> Date.parse(b.split(',')[0])}
	$arr.each do |ar|
		puts ar
	end
	puts $sum
else
	print_xml filename
end


