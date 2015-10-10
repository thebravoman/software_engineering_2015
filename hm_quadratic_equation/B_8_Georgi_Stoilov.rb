a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i
 
if(a == 0)
	print ""
else
	D = (b*b) - (4*a*c)
	D.to_i
	if(D > 0)
		x1 = ((-b) + Math.sqrt(D))/2*a
		x1.to_f
		x2 = ((-b) - Math.sqrt(D))/2*a
		x2.to_f
		if(x1 > x2)
			puts "#{x2},#{x1}"
		else
			puts "#{x1},#{x2}"
		end
		
	else
		if(D == 0)
			x = (-b)/2*a
			x.to_f
			puts "#{x}"
		end
	end
end
