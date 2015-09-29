print "A = "
A = gets.chomp.to_f
if (A == 0)
   puts 'Oooops, not a quadratic equation.'
   return
end
print 'B = '
B = gets.chomp.to_f
print 'C = '
C = gets.chomp.to_f
 
D = B*B - 4*A*C
 
if (D == 0)
   puts 'x = '+(-B/2/A).to_s
else
   if (D > 0)
      x1 = ((-B-Math.sqrt(D))/2/A).to_s
      x2 = ((-B+Math.sqrt(D))/2/A).to_s
      puts "#{x1}, #{x2}";
      
   else
      puts 'x1 = ('+(-B/2/A).to_s+','+(Math.sqrt(-D)/2/A).to_s+')'
      puts 'x2 = ('+(-B/2/A).to_s+','+(-Math.sqrt(-D)/2/A).to_s+')'
   end
end

