a = ARGV[0].to_i()
b = ARGV[1].to_i()
c = ARGV[2].to_i()
D = b*b - 4*a*c
  if D < 0
	puts;
      elsif 
	x1 = ((-b) - Math.sqrt(D)) / (2 * a)
	x2 = ((-b) + Math.sqrt(D)) / (2 * a)
	puts "#{x1},#{x2}"
      else 
        D == 0
	x = (-b) / (2 * a)
	puts x;
   end
