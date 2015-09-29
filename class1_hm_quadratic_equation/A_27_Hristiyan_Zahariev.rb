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
		answer = -b / 2 * a
		puts "X1 = %f, X2 = %f" % [answer, answer]
		puts "d = 0"
	else
		firstAnswer = ((-b) + Math.sqrt(d)) / (2*a)
		secondAnswer = ((-b) - Math.sqrt(d)) / (2*a)
	
		puts "X1 = %f, X2 = %f" % [firstAnswer, secondAnswer]
	end
end
