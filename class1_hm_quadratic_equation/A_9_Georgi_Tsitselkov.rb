a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i
discr = (b**2) - (4*a*c)
 if discr == 0
   x = (-b) / (2*a)
   puts x
 elsif discr > 0
   x1 = ((-b) + Math.sqrt(discr)) / (2 * a)
   x2 = ((-b) - Math.sqrt(discr)) / (2 * a)
   puts x1 , x2
 else
   puts "No solution"
end
