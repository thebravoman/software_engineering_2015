a = ARGV[0].to_f;
b = ARGV[1].to_f;
c = ARGV[2].to_f;

if a == 0
	answer = -c / b;
	puts "#{answer}";	
else 
	d = ((b ** 2) - (4 * a * c))
	if d == 0
		x1 = - b / (2 * a)
		puts "#{x1}"
	elsif d > 0.0
		x1 = (-b + Math.sqrt(d)) / (2 * a)
		x2 = (-b - Math.sqrt(d)) / (2 * a)
		
		if x1 < x2			
			puts "#{x1},#{x2}"
		else 
			puts "#{x2},#{x1}"
		end
	end
end
