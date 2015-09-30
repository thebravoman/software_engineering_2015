a, b, c = ARGV

a = a.to_f
b = b.to_f
c = c.to_f

x1 = 0
x2 = 0

if a==0
	result = -c/b
	puts "#{result}"
else
	d = ((b**2) - (4*a*c))
	if d==0
		xDouble = -b/(2*a)
		puts "#{xDouble}"
	elsif d>0.0
		x1 = (-b+Math.sqrt(d))/(2*a)
		x2 = (-b-Math.sqrt(d))/(2*a)
		if x1<x2
			puts "#{x1},#{x2}"
		end
		
		if x1>x2
			puts "#{x2},#{x1}"
		end
	end	
end
