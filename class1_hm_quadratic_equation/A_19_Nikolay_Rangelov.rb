a, b, c = ARGV;

a = a.to_f;
b = b.to_f;
c = c.to_f;

if a==0
	result = -c/b;
	puts "#{result}";
else
	d = ((b**2) - (4*a*c))
	#puts d;
	if d==0
		xDouble = -b/(2*a);
		puts "#{xDouble}";
	elsif d>0.0
		x1 = (-b+Math.sqrt(d))/2*a;
		x2 = (-b-Math.sqrt(d))/2*a;
		puts "#{x1},#{x2}";
	elsif d<0.0
		puts "No real roots!";
	end	
end
