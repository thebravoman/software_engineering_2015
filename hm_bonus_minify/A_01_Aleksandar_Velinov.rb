require 'csv'

file = ARGV[0].to_s
date = ARGV[1].to_s

file_csv=CSV.read(file)


file_csv.each do |row|
	if row[0] == date
		puts row.join(",")
	end
end
