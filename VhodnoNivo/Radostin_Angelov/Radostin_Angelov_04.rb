#fibonacci x < y
if ARGV[0].nil? || ARGV[1].nil?
	raise ArgumentError, "You must provide arguments"
	exit
end

x = ARGV[0].to_i
y = ARGV[1].to_i

fib1 = 0
fib2 = 1
fib3 = fib1 + fib2

while fib3 < x do
	fib1 = fib2
	fib2 = fib3
	fib3 = fib1 + fib2
end

while fib3 <= y do
	puts fib3
	fib1 = fib2
	fib2 = fib3
	fib3 = fib1 + fib2
end
