require 'csv'

array = []
file = CSV.read ARGV[0]
date = ARGV[1]
value = ARGV[2]

#my_csv = CSV.read file

def is_number? value
	true if Float(value) rescue false 
end

if is_number? value
	value = value.to_i
	file.each do |row|
		if row[0] == date && row[3].to_i >= (value - 10) && row[3].to_i <= (value + 10)
			puts row.join(",")
		end
	end
else 
	file.each do |row|
		if row[0] == date
			puts row.join(",").to_s
		end
	end
end