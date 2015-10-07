a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

discriminant = (b**2) - (4*a*c)

if discriminant == 0
	x = (-b) / (2*a)
	print x
elsif discriminant > 0 
	x1 = ((-b) + Math.sqrt(discriminant)) / (2 * a)
	x2 = ((-b) - Math.sqrt(discriminant)) / (2 * a)
if x1 < x2
	print x1,",",x2
else
	print x2,",",x1
end

end
