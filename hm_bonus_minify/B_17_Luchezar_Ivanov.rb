require 'csv'

file_arg = ARGV[0]
date_arg = ARGV[1]
value_arg = ARGV[2]
output = []
csv = CSV.read(file_arg)

csv.each do |row|
	if value_arg.nil?	
		if row[0] == date_arg
			output << row.join(',')
		end
	else
		if row[0] == date_arg and (row[3].to_i >= (value_arg.to_i - 10) and row[3].to_i <= (value_arg.to_i + 10))
			output << row.join(',')
		end
	end	
end

output.sort! { |a,b| [a[0],a[1].to_i] <=> [b[0],b[1].to_i] }
output.each do |element|
	puts element
end

