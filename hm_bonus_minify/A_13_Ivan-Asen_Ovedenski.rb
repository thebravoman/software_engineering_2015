require 'csv'

filename = ARGV[0]
date = ARGV[1]
value = ARGV[2].to_i
output_info = []

my_csv = CSV.read filename

my_csv.each do |line|
	if (line[0] == date)  && (line[3].to_i > (value - 10)) && (line[3].to_i < (value + 10))
		output_info << line.join(',')
	end
end

output_info.each do |element|
	print element
end
puts
