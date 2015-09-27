a = ARGV[0].to_i  
b = ARGV[1].to_i 
c = ARGV[2].to_i 
x1 = 0
x2 = 0
d = (b*b) - (4*a*c)
if(a == 0) 
	puts "This is not a quadratic equation"
elsif (d > 0)
		x1 = ((-b) + Math.sqrt(d)) / (2*a)
		x2 = ((-b) - Math.sqrt(d)) / (2*a)
		print "x1 = "
		puts x1
		print "x2 = " 
		puts x2
	elsif (d == 0)
			x1 = (-b) / (2*a)
			x2 = x1 	
			print "x1 = x2 = "
			puts x1
		else
			puts "The equation has no real roots"
		end


	

