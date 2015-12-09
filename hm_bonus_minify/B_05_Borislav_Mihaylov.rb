require 'csv'

file_name = ARGV[0]
date = ARGV[1]

csv = CSV.read ARGV[0]

csv.each = do |line|
	if line[0] == ARGV[1]
		puts line.join(",")
	end
end
