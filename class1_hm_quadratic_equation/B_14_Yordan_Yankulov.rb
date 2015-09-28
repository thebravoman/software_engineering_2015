	a = ARGV[0].to_i
	b = ARGV[1].to_i
	c = ARGV[2].to_i

	if a == 0
		if b == 0
		 puts "It's not defined"
		return
		elsif c == 0
		 x = 0
		puts #x
		return
		else
		 x  = -c/b
		puts #x
		return
		end
	else
	D = b**2 - 4*a*c
		if D < 0
		 puts "No real roots"
		return
		elsif D == 0
			x1 = -b/2*a
			puts #x1
			return
		else D > 0
			x1 = (-b + Math.sqrt(D))/2*a
			x2 = (-b - Math.sqrt(D))/2*a
			puts "#{x1} , #{x2}"
		end
	end					
		
