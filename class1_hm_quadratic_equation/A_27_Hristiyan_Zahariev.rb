a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

if a == 0
	puts "Equation is not quadric"
else
	d = b**2 - 4 * a * c

	if d < 0
		puts "There is no rational solution"
	elsif d == 0
		puts -b/2*a
	else
		x1 = ((-b) + Math.sqrt(d)) / (2*a)
		x2 = ((-b) - Math.sqrt(d)) / (2*a)
	
		print x1,",",x2
	end
end
