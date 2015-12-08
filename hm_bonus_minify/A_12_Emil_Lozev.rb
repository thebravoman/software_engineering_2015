require 'csv'
file_line_argument = ARGV[0]
date_line_argument = ARGV[1]
value = ARGV[2]

csv = CSV.read file_line_argument
array_to_display = []

csv.each do |line|
	if ARGV[2] == nil
		if line[0] == date_line_argument
			array_to_display << line.join(",")
		end
	elsif ARGV[2] != nil
		if line[0] == date_line_argument && (line[3].to_i >= (value.to_i - 10) && line[3].to_i <= value.to_i + 10)  
			array_to_display << line.join(",")
		end
	end
end

array_to_display.sort!
array_to_display.each do |element|
	p element
end