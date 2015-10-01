if ARGV[0].nil?
	raise ArgumentError, "You must provide arguments"
	exit
end

x = ARGV[0].to_i

if x < 0 || x >= 100
	raise ArgumentError, "x should be more than 0, but less than 100"
end

num_arr = []
rand = Random.new

for i in 0..9
	num = rand.rand((x + 1)..100)
	if i % 2 == 1
		bonus_arr = []
		bonus_arr.push(num)
		num_arr.push(bonus_arr)
	else
		num_arr.push(num)
	end
end

puts num_arr
