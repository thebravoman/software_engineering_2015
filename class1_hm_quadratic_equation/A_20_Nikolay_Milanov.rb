a = gets.to_i
b = gets.to_i
c = gets.to_i

D = b*b - 4*a*c

if D < 0
	puts
elsif D > 0
	x1 = ((-b) - Math.sqrt(D)) / (2 * a)
	x2 = ((-b) + Math.sqrt(D)) / (2 * a)
	if x1 < x2
		puts "#{x1},#{x2}"
	else
		puts "#{x2},#{x1}"
	end
elsif D == 0
		x = (-b) / (2 * a)
		puts "#{x}"
end