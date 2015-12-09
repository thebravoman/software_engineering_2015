require 'csv'

file_arg = ARGV[0]
date_arg = ARGV[1]
displayed_data = []
csv = CSV.read(file_arg)

csv.each do |row|
	if row[0] == date_arg
		displayed_data << row.join(',')
	end
end

displayed_data.sort!
displayed_data.each do |element|
	puts element
end

