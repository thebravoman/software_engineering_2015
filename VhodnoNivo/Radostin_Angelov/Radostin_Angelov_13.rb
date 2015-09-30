if ARGV[0].nil?
	raise ArgumentError, "You must provide arguments"
	exit
end

x = ARGV[0].to_i

if x < 0 || x >= 10
	raise ArgumentError, "x should be more than 0, but less than 10"
end

cosines = []
n = 1

for i in 0..9
	sum = 0.0
	start = n * x
	while start < (n + 1) * x
		sum += Math.cos(start)
		start += 1
	end
	cosines[i] = sum
	n += 1
end

puts cosines
