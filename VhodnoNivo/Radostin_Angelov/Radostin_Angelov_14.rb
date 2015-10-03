if ARGV[0].nil?
	raise ArgumentError, "You must provide arguments"
	exit
end

x = ARGV[0].to_i

if x < 0 || x >= 10
	raise ArgumentError, "x should be between 0 and 10"
end

nums = [10]

count = 0

n = 0

for i in 0..9
	while n % x != 0
		n += 1
	end
	
	n += 1

	sum = 0

	for j in 1..n
		sum += j
	end
	
	nums[i] = sum
end

puts nums
