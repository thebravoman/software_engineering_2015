a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f
x1 = 0.0
x2 = 0.0
d = 0.0

if a == 0
	x1 = (-c) / b
	puts "x1 = x2 = #{x1}"
elsif b == 0
	x1 = Math.sqrt(((-c) /a))
	puts "x1 = x2 = #{x1}"
else
	d = b*b - 4*a*c
	if d < 0
		puts "There are no solutions"
	elsif d == 0
		x1 = (-b) / (2*a)
		puts "x1 = x2 = #{x1}"
	else
		x1 = ((-b) + Math.sqrt(d)) / (2*a)
		x2 = ((-b) - Math.sqrt(d)) / (2*a)
		puts "x1 = #{x1}, x2 = #{x2}"
	end
end