a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i
d = (b * b) - (4 * a * c)
if d > 0
	x1 = (-b + Math.sqrt(d)) / 2*a
	x2 = (-b - Math.sqrt(d)) / 2*a
	if x1 > x2
		print x2, ",", x1
		puts
	else
		print x1, ",", x2
		puts
	end
elsif d == 0
	x = -b / 2 * a	
	print x
	puts
else 
	puts ""

end



