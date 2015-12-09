require 'csv'

file = ARGV[0]
date = ARGV[1]
csv = CSV.read file

csv.each { |x|
	if x[0] == date
		puts x.join(',').to_s
	end
}