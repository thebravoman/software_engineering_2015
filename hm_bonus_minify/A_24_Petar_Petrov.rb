require 'csv'

file = ARGV[0]
if file.split(".").last == "csv"	
	csv = CSV.read(ARGV[0])
	date_requested = ARGV[1]
	csv.each do |row|
		if row[0] == date_requested && row.size == 6
			puts "#{row[0]}, #{row[1]}, #{row[2]}, #{row[3]}, #{row[4]}, #{row[5]}"
		end
	end
end
