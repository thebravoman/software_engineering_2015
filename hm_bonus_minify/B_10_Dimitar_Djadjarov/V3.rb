require 'csv'
file_arg = ARGV[0]
data = ARGV[1]
suma = ARGV[2]
csv = CSV.read file_line_argument
disp = []
sum = 0
csv.each do |line|
	if ARGV[2] == nil
		if line[0] == data
			disp << line.join(",")
		elsif line[1] == data
			disp << line.join(",")
			sum += line[3].to_i
		end
		disp.sort!
	elsif ARGV[2] != nil
		if line[0] == data && (line[3].to_i <= suma.to_i + 10) && (line[3].to_i >= (suma.to_i - 10)  
			display << line.join(",")
		end
	end
end
puts disp
if sum != 0
	puts sum
end
