require 'csv'

my_csv = CSV.read ARGV[0]
date = ARGV[1]
value = ARGV[2].to_i
if ARGV[2]
	puts value
my_csv.each do |line|	
	if line[0] == date && line[3].to_i.between?((value-10),(value+10))
		puts line.join(",")
	end
end
else 
  my_csv.each do |line|	
	if line[0] == date
		puts line.join(",")
	end
end
end

