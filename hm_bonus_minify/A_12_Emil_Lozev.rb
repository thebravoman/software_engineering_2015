require 'csv'
file_line_argument = ARGV[0]
date_line_argument = ARGV[1]
value = ARGV[2]

csv = CSV.read file_line_argument
array_to_display = []
sum_amount = 0

csv.each do |line|
	if ARGV[2] == nil
		if line[0] == date_line_argument
			array_to_display << line.join(",")
		elsif line[1] == date_line_argument
			array_to_display << line.join(",")
			sum_amount += line[3].to_i
		end
		array_to_display.sort!
	elsif ARGV[2] != nil
		if line[0] == date_line_argument && (line[3].to_i >= (value.to_i - 10) && line[3].to_i <= value.to_i + 10)  
			array_to_display << line.join(",")
		end
	end

end

puts array_to_display
if sum_amount != 0
	puts sum_amount
end