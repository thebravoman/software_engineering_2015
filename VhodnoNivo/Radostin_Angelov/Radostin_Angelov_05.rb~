if ARGV[0].nil?
	raise ArgumentError, "You must provide arguments"
	exit
end

x = ARGV[0].to_i

if x < 0 || x > 10
	raise ArgumentError, "Argument doesn't meet requirements.
		It should be more than 0, but less than 10"
end

cos_array = []

for i in 0..x - 1
	cos_array.push(Math.cos(i))
end

cos_array.sort!.reverse!

puts cos_array

