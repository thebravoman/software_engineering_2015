a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i
D =  (b*b) - (4*a*c)
x1 = (-b - Math.sqrt(D))/2*a 
x2 = (-b + Math.sqrt(D))/2*a

	if D > 0 then
		if x1 > x2 then
		puts "#{x1},#{x2}"
		else puts "#{x1},#{x2}"
	elsif D == 0 then
	puts "#{-b/2*a}"
	else
		puts "equation has no roots"
end
puts " "
