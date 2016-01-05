require 'csv'
file_line = ARGV[0]
date_line = ARGV[1]
value = ARGV[2]

csv = CSV.read file_line
to_print = []

csv.each do |line|
	if ARGV[2] == nil
		if line[0] == date_line
			to_print << line.join(",")
		end
	elsif ARGV[2] != nil
		if line[0] == date_line && (line[3].to_i >= (value.to_i - 10) && line[3].to_i <= value.to_i + 10)  
			to_print << line.join(",")
		end
	end
end

to_print.sort!
to_print.each do |element|
	p element
end