require 'csv'
filename = ARGV[0]

date = ARGV[1]
input_val = ARGV[2].to_i
DATE_ELEMENT = 0

if ARGV[2]
	CSV.open(filename, 'r').each do |row|
		val = row[3]
		val = val.to_i
		if row[DATE_ELEMENT] == date && (val-10)<input_val && input_val<(val+10)
			puts row.join(",").to_s
		end
	end
else
	CSV.open(filename, 'r').each do |row|
		if row[DATE_ELEMENT] == date
		  puts row.join(",").to_s
		end  
	end
end
