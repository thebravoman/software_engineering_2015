a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

disc = (b*b) - (4*a*c)

if(disc < 0)
	puts"No real roots!"
else
x1 = (-b + Math.sqrt(disc)) / (2*a)
x2 = (-b - Math.sqrt(disc)) / (2*a)

if (x1 != x2)
	puts "#{x1},#{x2}" 
else 
	puts x1
end
end
