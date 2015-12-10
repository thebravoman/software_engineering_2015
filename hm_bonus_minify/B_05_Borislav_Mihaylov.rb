require 'csv'

file_name = ARGV[0]
date = ARGV[1]
value = ARGV[2]
res = []

my_csv = CSV.read ARGV[0]

file_name.each do |line|
	if line[0] == ARGV[1]
		puts line.join(",")
	end

	l = line.split(',')
	if l[0] == date and l[2].to_i >= value.to_i - 10 and l[2].to_i <= value.to_i + 10 
	
	res << line
 	
end

puts res
