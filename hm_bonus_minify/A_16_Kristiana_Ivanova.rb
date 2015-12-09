require 'csv'

file = ARGV[0]
date = ARGV[1]

my_csv = CSV.read file

my_csv.each do |row|
	if row[0] == date
		puts row.join(",").to_s
	end
end