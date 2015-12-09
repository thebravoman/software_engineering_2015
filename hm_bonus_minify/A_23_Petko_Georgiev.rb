require 'csv'

filename = ARGV[0]
requested_date = ARGV[1]

output = []
CSV.foreach(filename) do |row|
	if row[0] == requested_date
		output << row
	end
end

output.each do |row|
	puts "#{row.join(', ')}"
end
