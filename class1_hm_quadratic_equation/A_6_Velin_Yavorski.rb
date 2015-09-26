a = ARGV[0].to_i;
b = ARGV[1].to_i;
c = ARGV[2].to_i;

disc = (b*b) - (4*a*c)
disc.to_i
if(disc < 0)
	puts"Nqma koreni !"
else
x1 = (-b + Math.sqrt(disc)) / (2*a)
x1.to_i
x2 = (-b - Math.sqrt(disc)) / (2*a)
x2.to_i
puts " "
if (x1 != x2)
	print "(",x1,", ",x2,")" 
else 
	print "x = ",x1
end
puts " "
end