require 'csv'

fileName = ARGV[0]
date = ARGV[1]


CSV.read(fileName, 'r').each do |row|
	if row[0] == date
		puts row.join(" , ")
	end
end
