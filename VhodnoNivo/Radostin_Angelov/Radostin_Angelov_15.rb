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

mult = 1

while count < 10 do
	sum = 0
	for i in 1..1000
		if i % (x * mult)== 0
			sum += i
		end
	end
	
	nums.push(sum)
	count += 1
	mult += 1
end

puts nums
