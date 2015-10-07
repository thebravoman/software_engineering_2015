a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i
   d = b*b - 4*a*c 

   if d < 0 
   	puts 
   end

   if (d == 0) && (a != 0) 
	   x= -b / 2 * a
	   puts x
   end

   if d > 0 && (a != 0)
   	x1 = ((-b) + Math.sqrt(d)) / (2 * a)
   	x2 = ((-b) - Math.sqrt(d)) / (2 * a)	
   end
   x3 = 0
   if (x2<x1)
   	x3=x1
   	x1=x2	
   	x2=x3
   end

   result = [x1,x2]
   puts "#{result[0]},#{result[1]}"
