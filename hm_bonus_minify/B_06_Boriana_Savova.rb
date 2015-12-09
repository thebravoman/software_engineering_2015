require 'csv'
filename = ARGV[0]
date = ARGV[1]

file = File.open(filename, 'r')

file.each do |row|
	row = row.split(',')
	if row[0] == date
		puts row.join(',')
	end
end