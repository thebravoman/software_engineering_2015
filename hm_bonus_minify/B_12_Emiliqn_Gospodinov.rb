require 'csv'

file_for_reading = CSV.read ARGV[0]

description = ARGV[1]

sum = 0

line_holder = []

file_for_reading.each do |column|
	if column[1] == description.to_s
		sum = sum + column[3].to_i
		line_holder << column
	end
end

line_holder.sort_by! do |date|
	period = date.first.split('/')
	day = period[0].to_i
	month = period[1].to_i
	year = period[2].to_i
	[day,month,year]
end

line_holder.each do |column|
	puts column.join(",")
end

puts sum
=begin  here is V2 which needed value and date. V3 dont need them like arguments o.O
require 'csv'

file_for_reading = CSV.read ARGV[0]

date = ARGV[1]

value = ARGV[2]

file_for_reading.each do |column|
	if column[0] == date and column[3].to_i >= value.to_i - 10 and column[3].to_i <= value.to_i + 10 
		puts column.join(",")
	end
end
=end
