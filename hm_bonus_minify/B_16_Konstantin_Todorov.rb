require 'csv'

datafile = CSV.read ARGV[0]

datafile.each do |line|
	if line[0] == ARGV[1]
		puts line.join(",")
	end
end
