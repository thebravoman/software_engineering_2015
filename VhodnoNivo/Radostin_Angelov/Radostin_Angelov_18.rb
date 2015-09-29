def is_divisor(num, possible_divisor)
	return (num % possible_divisor) == 0
end

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

if x < 0
	raise ArgumentError, "x should be >= 0"
end

divisors = []

next_divisor = 1

while true do
	if is_divisor(x, next_divisor)
		divisors.push(next_divisor)
		if divisors.length == 10
			break
		end
	end
	
	next_divisor += 2
	
	if next_divisor > x
		break
	end
end

puts divisors

puts "Printing pribe divisor numbers..."

for i in 0..divisors.length - 1
	if is_simple(divisors[i])
		puts "next prime from divisors: %d" % [ ndivisors[i]]
	end
end
