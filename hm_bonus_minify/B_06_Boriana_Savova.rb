require 'csv'
filename = ARGV[0]
date = ARGV[1]
value = ARGV[2].to_i


file = File.open(filename, 'r')

file.each do |row|
	row = row.split(',')
	if row[0] == date
		if (row[3].to_i<value+10) && (row[3].to_i>value-10)
			puts row.join(',')
		end
	end
end