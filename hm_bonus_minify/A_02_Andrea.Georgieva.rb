require 'csv'

file_name = ARGV[0]
date = ARGV[1]
value = ARGV[2].to_i
value_1 = value + 10
value_2 = value - 10

csv_file = CSV.read file_name

csv_file.each do |line|
		if line[0] == date 
			if (line[3].to_i <= value_1) and (line[3].to_i >= value_2) or ARGV[2] == nil
				puts line.join(",").to_s
			end
		end
end