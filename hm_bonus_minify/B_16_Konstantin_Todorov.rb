require 'csv'

datafile = CSV.read ARGV[0]

datafile.each do |line|
	if line[0] == ARGV[1] && line[4].to_i <= (ARGV[2].to_i + 10) && line[4].to_i >= (ARGV[2].to_i - 10)
		puts line.join(",")
	end
end
