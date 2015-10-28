a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f

   	d = b*b - 4*a*c
   
   	if d < 0 || a == 0 
   		puts
   	end
   
	if (d == 0) && (a != 0) 
    		x= ((-b) / (2 * a))
	   		puts x
   	end

   	if d > 0 && (a != 0)
   		x1 = ((-b) + Math.sqrt(d)) / (2 * a)
   		x2 = ((-b) - Math.sqrt(d)) / (2 * a)	
   
        if (x2 > x1)
        	x1,x2 = x2,x1
        end
        puts "#{x1},#{x2}"
	end
