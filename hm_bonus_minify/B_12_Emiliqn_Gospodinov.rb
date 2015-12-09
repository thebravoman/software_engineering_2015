require 'csv'

file_for_reading = CSV.read ARGV[0]

date = ARGV[1]

value = ARGV[2]

file_for_reading.each do |column|
	if column[0] == date and column[2].to_i >= value.to_i - 10 and column[2].to_i <= value.to_i + 10 
		puts column
	end
end
