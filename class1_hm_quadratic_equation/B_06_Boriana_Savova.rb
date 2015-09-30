a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i
if a == 0 
	puts " This is not a quadratic equation!"
end
D = b**2 - ( 4*a*c )
	if D < 0 
		puts "There are no roots!"
	elsif D == 0 
		x = - b / (2 * a) 
		puts x
	else 
		x1 = (-b + Math.sqrt(D))/ (2 * a)
		x2 = (-b - Math.sqrt(D))/ (2 * a)
		puts "#{x1}, #{x2}"
	end 