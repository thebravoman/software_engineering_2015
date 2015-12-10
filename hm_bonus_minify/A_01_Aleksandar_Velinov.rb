require 'csv'

file = ARGV[0]
date = ARGV[1]
value = ARGV[2]

minimum = value.to_f - 10
maximum = value.to_f + 10

file_csv=CSV.read(file)

file_csv.each do |row|
	amount = row[3].to_f
	if row[0] == date && (value == nil || ( amount > minimum && amount < maximum ))
		puts row.join(",")
	end
end
