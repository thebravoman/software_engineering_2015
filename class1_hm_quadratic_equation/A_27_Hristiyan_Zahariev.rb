a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

if a != 0
	d = b**2 - 4 * a * c

	if d == 0
		print -b/2*a
	elsif d > 0
		x1 = ((-b) + Math.sqrt(d)) / (2*a)
		x2 = ((-b) - Math.sqrt(d)) / (2*a)
	
		print x1,",",x2
	end
end

