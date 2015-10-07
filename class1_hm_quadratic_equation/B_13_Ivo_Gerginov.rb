a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i
D =  (b*b) - (4*a*c)
x1 = (-b - Math.sqrt(D))/2*a 
x2 = (-b + Math.sqrt(D))/2*a

	if D > 0
	
		if x1 > x2 
		puts "#{x1},#{x2}"
		else puts "#{x2},#{x1}"
		end
	
	elsif D == 0 
	puts "#{-b/2*a}"
	else
		puts "equation has no roots"
end
