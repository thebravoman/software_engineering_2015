require 'csv'

file = ARGV[0]
date = ARGV[1]
value = ARGV[2].to_i
v1 = value - 10
v2 = value + 10
csv = CSV.read file

csv.each { |x|
	if x[0] == date
		if (x[3].to_i >= v1) && (x[3].to_i <= v2) 
			puts x.join(',').to_s
		end
	end
}
