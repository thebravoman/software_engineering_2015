require 'csv'

my_csv = CSV.read ARGV[0]
date = ARGV[1]
value = ARGV[2].to_i
sum = 0
rows = []

if !(date =~ /\d/) && !(date.include? '/') && !(date.include? '<') 
	my_csv.each do|line|
		if line[1] == date
			sum += line[3].to_i
			rows.push line.join(',')
		end
	end
	rows.sort!
	rows.each do |row|
		puts row
	end
	puts sum
end


if ARGV[2]
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

