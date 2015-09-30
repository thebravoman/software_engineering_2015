a = ARGV[0].to_i()
b = ARGV[1].to_i()
c = ARGV[2].to_i()

d = b*b - 4*a*c

if d < 0
	puts
elsif d == 0
	x1 = (-b) / (2 * a)
	puts x1
else
	x1 = ((-b) - Math.sqrt(d)) / (2 * a)
	x2 = ((-b) + Math.sqrt(d)) / (2 * a)
	puts "#{x1},#{x2}"

end
