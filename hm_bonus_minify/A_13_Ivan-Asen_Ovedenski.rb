require 'csv'

filename = ARGV[0]
date = ARGV[1]
output_info = []

my_csv = CSV.read filename

my_csv.each do |line|
	if line[0] == date 
		output_info << line.join(',')
	end
end

output_info.each do |element|
	p element
end

