a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

disc = (b*b) - (4*a*c)

if(disc < 0)
	
else
x1 = (-b + Math.sqrt(disc)) / (2*a)
x2 = (-b - Math.sqrt(disc)) / (2*a)

if (x1 != x2)
	if(x1 > x2)
		puts "#{x2},#{x1}" 
	else
		puts "#{x1},#{x2}"
	end
else 
	puts x1
end
end
