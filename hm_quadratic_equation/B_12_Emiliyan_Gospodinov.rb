A=ARGV[0].to_f;
B=ARGV[1].to_f;
C=ARGV[2].to_f;

D=B*B - 4*A*C;

if (D==0)
	x1=x2=-B/(2*A)
	puts "#{x1}"
else if (D>0)
	x1=(-B+Math.sqrt(D))/(2*A)
	x2=(-B-Math.sqrt(D))/(2*A)
	if x1 > x2
		puts "#{x2},#{x1}"
	else 
		puts "#{x1},#{x2}"
	end
end
end
