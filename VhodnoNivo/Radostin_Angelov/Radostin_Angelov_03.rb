if ARGV[0].nil? || ARGV[1].nil?
	raise ArgumentError, "You must provide arguments"
	exit
end

def is_simple(number)
	number = number.to_i
	for i in 2..number - 1
		if number % i == 0
			return false
		end
	end
	
	return true
end

x = ARGV[0].to_i
y = ARGV[1].to_i

if x > y
	puts "x should be less than y"
	exit
end

for i in x..y
	if is_simple(i)
		if i % 10 === 3
			puts i
		end
	end
end
	
