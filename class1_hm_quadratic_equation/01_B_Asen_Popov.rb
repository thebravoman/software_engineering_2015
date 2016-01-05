a,b,c=ARGV
a=a.to_f
b=b.to_f
c=c.to_f

if (a==0)
	puts "Not a quadratic equation"
end
d=b**2-4*a*c
if (d>0)
	x1=(-b+Math.sqrt(d))/2*a
	x2 = (-b-Math.sqrt(d))/2*a
	if (x1>x2)
		puts "#{x2},#{x1}"
	else
		puts "#{x1},#{x2}"
	end
elsif (d==0)
	x1=(-b-Math.sqrt(d))/2*a
	puts "#{x1}"
end
