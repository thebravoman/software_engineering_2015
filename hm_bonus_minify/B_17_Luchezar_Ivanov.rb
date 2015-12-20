require 'csv'

file_arg = ARGV[0]
date_arg = ARGV[1]
value_arg = ARGV[2]
output = []
csv = CSV.read(file_arg)
sum = 0

csv.sort_by! do |element|
  date = element[0].split("/")
  [date[2].to_i, date[1].to_i, date[0].to_i]
end

csv.each do |row|
	if value_arg.nil?	
		if row[0] == date_arg
			output << row.join(',')
		elsif 
			row[1] == date_arg
			output << row.join(",")
			sum += row[3].to_i
		end
	else
		if row[0] == date_arg and (row[3].to_i >= (value_arg.to_i - 10) and row[3].to_i <= (value_arg.to_i + 10))
			output << row.join(',')
		end
	end	
end


output.each do |element|
	puts element
end
if sum != 0
	puts sum.to_i
end

