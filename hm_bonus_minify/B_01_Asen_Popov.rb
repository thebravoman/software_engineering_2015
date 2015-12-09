require 'csv'

fileName = ARGV[0]
date = ARGV[1]
value = ARGV[2].to_i

CSV.read(fileName, 'r').each do |row|
	if row[0] == date
		if (row[3].to_i > value-10) && (row[3].to_i < value+10) 
			puts row.join(" , ")
		end
	end
end
