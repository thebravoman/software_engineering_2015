a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f

if a == 0
	if b == 0
		if c == 0
			puts "X ∈ R"
		else
			puts "X ∈ ∅"
		end
		
		exit
	end
	
	puts "X = %f" % [-c / b]
else
	d = b**2 - 4 * a * c

	if d == 0
		answer = -b / (2 * a)
		puts "#{answer}"
	elsif d > 0
		d_sqrt = Math.sqrt(d)
		first_answer = (-b + d_sqrt) / (2 * a)
		second_answer = (-b - d_sqrt) / (2 * a)
	
		if first_answer < second_answer
			puts "#{first_answer},#{second_answer}"
		else
			puts "#{second_answer},#{first_answer}"
		end
	end
end
