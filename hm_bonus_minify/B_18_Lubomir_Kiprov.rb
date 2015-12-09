require 'csv'

def chek_range_of_amount (value, line)
	if (line.split(',')[3].to_i > value.to_i - 10 and line.split(',')[3].to_i < value.to_i + 10) || ARGV.size == 2
		print_line(line)
	end
end

def print_line (line)
	puts line
end

filename = ARGV[0]
searching_date = ARGV[1]
File.open(filename, "r") do |row|
	row.each do |line|
		if line.include? searching_date
			chek_range_of_amount ARGV[2], line
		end
	end
end


