if ARGV[0].nil?
	raise ArgumentError, "You must provide arguments"
	exit
end

x = ARGV[0].to_i

if x < 0 || x > 10
	raise ArgumentError, "x should be more than 0, but less than 10"
end

def sort_strategy(number, x)
	if number % 10 == x
		return 1
	end
	
	return 0
end

num_arr = [100]

random = Random.new

for i in 0..99
	num_arr[i] = random.rand(0..100)
end

num_arr.sort! {|a|sort_strategy(a, x)}
num_arr.reverse!

puts "HERE IS THE SORTED ARRAY"
puts num_arr

#it doesn't work for one or two values and I can't figure out why -> just ruby things. It works for 10 values, and it randomly skips one - what!?
