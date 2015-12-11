require 'csv'

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

filename = ARGV[0]
searching_date = ARGV[1]
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


