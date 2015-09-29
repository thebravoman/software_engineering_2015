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
	if i % 2 == 0
		bonus_arr = []
		for j in 0..4
			bonus_arr.push(num)
		end
		num_arr.push(bonus_arr)
	else
		num_arr.push(num)
	end
end

puts num_arr
