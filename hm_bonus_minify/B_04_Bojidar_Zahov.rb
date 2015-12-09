#Version 1
file = ARGV[0]
date = ARGV[1]
require 'csv'
csv = CSV.read file
csv.each do |row|
	if row[0] == date
		puts row.join(",")
	end
end
