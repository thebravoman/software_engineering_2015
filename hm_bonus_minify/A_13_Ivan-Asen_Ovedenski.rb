require 'csv'

def match_dates? line, date
	line[0] == date
end

def is_within_value? line, date, value
	(line[3].to_i > (value - 10)) && (line[3].to_i < (value + 10))
end

filename = ARGV[0]
first_argument = ARGV[1]
value = ARGV[2].to_i
output_info = []
sum = 0

my_csv = CSV.read filename

my_csv.each do |line|
	if value == 0
		if	(line[0] == first_argument)
			output_info << line.join(',')
		end
	elsif (is_within_value? line, first_argument, value) && (match_dates? line, first_argument)
		output_info << line.join(',')
	end
end

output_info.each do |element|
	puts element
end

