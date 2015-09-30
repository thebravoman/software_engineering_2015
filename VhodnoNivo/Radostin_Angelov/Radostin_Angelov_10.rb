if ARGV[0].nil?
	raise ArgumentError, "You must provide arguments"
	exit
end

x = ARGV[0].to_i

if x < 0 || x >= 10
	raise ArgumentError, "x should be more than 0, but less than 10"
end

fibs = []

fib1 = 0
fib2 = 1
fib3 = 0

count = 0

while count < 10 do
	if fib3 % x == 0
		fibs.push(fib3)
		count += 1
	end
	
	fib3 = fib1 + fib2
	fib1 = fib2
	fib2 = fib3
end

puts fibs
