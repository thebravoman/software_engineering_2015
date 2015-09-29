if ARGV[0].nil?
	raise ArgumentError, "You must provide arguments"
	exit
end

x = ARGV[0].to_i

if x < 0 || x >= 10
	raise ArgumentError, "x should be between 0 and 10"
end

fibs = [10]

count = 0

fib1 = 0
fib2 = 1
fib3 = 0

while count < 10 do
	if fib3 % 10 == x
		fibs.push(fib3)
		count += 1
	end
	
	fib3 = fib1 + fib2
	fib1 = fib2
	fib2 = fib3
end

puts fibs

