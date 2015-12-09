require 'csv'

file_name = ARGV[0]
date = ARGV[1]
csv_file = CSV.read file_name

csv_file.each do |line|
		if line[0] == date 
			puts line.join("--->").to_s
		end
end