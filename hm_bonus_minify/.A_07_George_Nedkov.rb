require 'csv'

fname = ARGV[0]
data = ARGV[1]

c = CSV.read ARGV[0]

c.each  do |line|
	if line[0] == ARGV[1]
		puts line.join(",")
	end
end
