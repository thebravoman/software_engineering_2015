if ARGV[0].nil?
	raise ArgumentError, "You must provide arguments"
	exit
end

x = ARGV[0].to_f
y = ARGV[0].to_f
w = ARGV[0].to_f
h = ARGV[0].to_f

if x <= 0 || y <= 0 || w <= 0 || h <= 0
	raise ArgumentError, "no argument should be less or equal to 0"
end

tablets_count = (x * y) / (w * h)

coord = 0
coords = []

for i in 0..9
	if coord <= x - w
		coords[i] = coord
		coord += w
	end
end

puts coords
