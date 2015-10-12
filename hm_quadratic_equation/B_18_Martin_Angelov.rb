a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i
	d=(b*b)-(4*a*c)
if 	d>0
	  x1= (-b - Math.sqrt((b ** 2) - (4 * a * c)) ) / (2 * a)
	  x2= (-b + Math.sqrt((b ** 2) - (4 * a * c)) ) / (2 * a)
	 
	 if x2 > x1 
	 	puts "#{x1},#{x2}" 
	 else 
	 	puts "#{x2},#{x1}" 
	 end

elsif 	d==0
	  x=-b/2*a	
	 
	  puts x
else    
	
    	puts "Nqma realni koreni"
end




