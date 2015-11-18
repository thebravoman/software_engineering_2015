a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i
d = b**2 - 4 * a * c
  if (d == 0)
	  puts -b/2*a
  elsif d > 0
  	x1 = (-b + Math.sqrt(d)) / (2 * a)	
	x2 = (-b - Math.sqrt(d)) / (2 * a)
  end 	
  if x2 > x1 
 	  puts "#{x1},#{x2}" 
  else 
 	  puts "#{x2},#{x1}" 
  end
