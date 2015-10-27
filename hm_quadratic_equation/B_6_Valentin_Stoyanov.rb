a = ARGV[0].to_i  
b = ARGV[1].to_i 
c = ARGV[2].to_i 
x1 = 0
x2 = 0
d = (b*b) - (4*a*c)
if(a == 0) 
	#
elsif (d > 0)
		x1 = ((-b) + Math.sqrt(d)) / (2*a)
		x2 = ((-b) - Math.sqrt(d)) / (2*a)
		if (x1 < x2)
			puts "#{x1},#{x2}"
		else 
			puts "#{x2},#{x1}"
		end
	elsif (d == 0)
			x1 = (-b) / (2*a)
			x2 = x1 	
			puts x1
		else
			#
		end


	

