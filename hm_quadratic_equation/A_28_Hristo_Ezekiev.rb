a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

d = b*b - 4*a*c

=begin
puts a.to_s
puts b.to_s
puts c.to_s
puts d.to_s
=end
if a == 0
	puts -c/b
else
	
	if d>0
		x1 = (-b + Math.sqrt(d))/2*a
		x2 = (-b - Math.sqrt(d))/2*a
		if x2>x1
			puts x1.to_s+", "+x2.to_s
		else
			puts x2.to_s+", "+x1.to_s
		end
	elsif d == 0
		x1 = -b/2*a
		puts x1.to_s
	else
		puts "There are no real roots"
	end

end
	
