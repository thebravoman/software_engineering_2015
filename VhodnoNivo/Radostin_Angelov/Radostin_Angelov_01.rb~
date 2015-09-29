if ARGV[0].nil? || ARGV[1].nil?
	raise ArgumentError, "You must provide arguments"
	exit
end

x = ARGV[0].to_i
y = ARGV[1].to_i

if x > y
	puts "x should be less than y"
	exit
end

sum = 0

for i in x..y
	if i % 2 != 0
		sum += i
	end
end

puts "sum = %d" % [sum]
