A=ARGV[0].to_f;
B=ARGV[1].to_f;
C=ARGV[2].to_f;

D=B*B - 4*A*C;

else if (D==0)
	x1=x2=-B/(2*A)
	puts "#{x1}"
else
	x1=(-B+Math.sqrt(D))/(2*A)
	x2=(-B-Math.sqrt(D))/(2*A)
	puts "#{x1},#{x2}"
end
end
