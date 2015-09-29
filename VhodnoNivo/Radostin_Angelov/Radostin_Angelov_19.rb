def is_simple(number)
	if number == 1
		return false
	end

	number = number.to_i
	for i in 2..number - 1
		if number % i == 0
			return false
		end
	end
	
	return true
end

if ARGV[0].nil?
	raise ArgumentError, "You must provide arguments"
	exit
end

x = ARGV[0].to_f

if x < 0 || x > 1
	raise ArgumentError, "x should be more than 0, but less than 1"
end

puts x

start_prime = 1
inc_num = 0
twin_sum = 0.6

while true do
	if is_simple(start_prime)
		inc_num = start_prime + 2
		if is_simple(inc_num)
			twin_sum = (1.0 / start_prime) + (1.0 / inc_num)
			if twin_sum < x
				puts "Exited on: %f" % [ twin_sum]
				exit
			end
		end
	end
	
	start_prime += 2
end
