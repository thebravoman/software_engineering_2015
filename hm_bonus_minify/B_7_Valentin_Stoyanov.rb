file = File.open(ARGV[0])
date = ARGV[1]
value = ARGV[2]
output = []
 
file.each do |line|
	l = line.split(',')
	if l[0] == date 
		value = value.to_i
		if l[3].to_i > value - 10 and l[3].to_i < value + 10
			output << line
		end
	end
end

puts output
