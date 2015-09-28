#!/usr/bin/ruby
a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f
if a == 0 
	puts "No quadratic equation"
else 
	if (b == 0 || c == 0)
		puts "Not completed quadratic equation "
	else
		discriminant = b * b - 4 * a * c
		if(discriminant < 0) 
			puts "No real roots "
		else 
			if ( discriminant == 0 )
				x1 = -b/ 2 * a
				print "x1 = x2 = ",x1
				print "\n"
			else 
				x1 = (-b - Math.sqrt(discriminant)) / 2 * a
				x2 = (-b + Math.sqrt(discriminant)) / 2 * a
				print "x1 = ", x1 
				print ", "
				print "x2 = ", x2
				puts " "
			end
		end
	end
end
