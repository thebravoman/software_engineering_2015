require 'csv'
file_line_argument = ARGV[0]
date_line_argument = ARGV[1]

csv = CSV.read file_line_argument
array_to_display = []

csv.each do |line|
	if line[0] == date_line_argument
		array_to_display << line.join(",")
	end
end

array_to_display.sort!
array_to_display.each do |element|
	p element
end