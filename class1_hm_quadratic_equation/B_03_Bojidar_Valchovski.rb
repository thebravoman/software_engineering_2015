#!/usr/bin/ruby

a = ARGV[0].to_i;
b = ARGV[1].to_i;
c = ARGV[2].to_i;
	
puts "#{a}x^2 + #{b}x + #{c} = 0"

if b == 0
	puts "This is no longer a quadratic equation!"
	else
	if a == 0
		puts "The aforementioned equation is linear, not quadratic!"
		cInv = c.to_f - (2*c.to_f)
		l_result = cInv.to_f / b.to_f
		puts "The result to the linear equation is " + l_result.to_s + "!"	
	else

		disc = (b ** 2) - (4*a*c)
	
		if disc == 0
			x = -b/2*a
			puts x
		elsif disc > 0
			x1 = (-b + disc)/2*a
			x2 = (-b - disc)/2*a
			puts "X1 = #{x1} ; X2 = #{x2}" 
		else
			puts "The discriminant is less than 0 therefore there are no possible answers!"
		end
	end
end
