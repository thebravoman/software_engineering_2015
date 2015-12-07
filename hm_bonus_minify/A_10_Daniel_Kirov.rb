require 'csv'

my_csv = CSV.read ARGV[0]
date = ARGV[1]
my_csv.each do |line|
	line.each do |element|	
		if element == date
			puts line.join(",")
		end
	end
end

