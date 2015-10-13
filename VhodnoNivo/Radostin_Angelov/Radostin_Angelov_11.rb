if ARGV[0].nil?
	raise ArgumentError, "You must provide arguments"
	exit
end

x = ARGV[0].to_f

if x < 0 || x >= 1
	raise ArgumentError, "x should be more than 0, but less than 1"
end

divider = 5.0
i = 1

result = 4.0 - 4/3

while(4 / divider >= x)
	if i == 1
		result += 4.0 / divider
		i = 0
	else
		result -= 4.0 / divider
		i = 1
	end
	
	divider += 2.0
end

puts result
