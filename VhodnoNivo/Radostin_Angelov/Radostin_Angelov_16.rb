def is_simple(number)
	if number == 1
		return false
	end

	
	for i in 2..(number - 1)
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

x = ARGV[0].to_i

if x < 0 || x >= 10
	raise ArgumentError, "x should be between 0 and 10"
end

next_prime = 3
count = 0

primes = [10]

while count < 10 do
	if is_simple(next_prime)
		if next_prime % 10 == x
			primes.push(next_prime)
			count += 1	
		end
	end
	
	next_prime += 2
end

puts primes
