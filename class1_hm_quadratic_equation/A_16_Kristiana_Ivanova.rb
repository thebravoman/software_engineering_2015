A = gets.chomp.to_f
if (A == 0)
   puts 'Oooops, not a quadratic equation.'
   return
end
B = gets.chomp.to_f

C = gets.chomp.to_f
 
D = B*B - 4*A*C
 
if (D < 0)
puts #No real roots 

elsif  (D == 0)
   	x1 = (-B)/2*a
   	puts x1
else
      x1 = ( (-B) - (Math.sqrt(D) ) )/(2 * A)
      x2 = ( (-B) + (Math.sqrt(D) ) )/(2 * A)
      puts "#{x1},#{x2}";
      
end

