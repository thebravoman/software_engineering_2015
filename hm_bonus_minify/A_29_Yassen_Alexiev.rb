require 'csv'

array = []
file_name = CSV.read ARGV[0]
date = ARGV[1]

file_name.each do |row|
	if row[0] == date
		puts row.join(",")
	end
end