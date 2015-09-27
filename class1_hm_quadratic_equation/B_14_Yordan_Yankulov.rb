	puts "Insert a = "
	a = gets.chomp.to_f
	puts "Insert b = "
	b = gets.chomp.to_f
	puts "Insert c = "
	c = gets.chomp.to_f

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
			puts "X1 = #{x1}"
			puts "X2 = #{x2}"
		end
	end					
		
