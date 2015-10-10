puts 'a = '
a = gets.chomp.to_f
puts 'b = '
b = gets.chomp.to_f
puts 'c = '
c = gets.chomp.to_f
 
D = b*b - 4*a*c
 
if (D == 0)
   puts (-b/2/a).to_s
else
   if (D > 0)
      puts ((-b-Math.sqrt(D))/2/a).to_s
      puts ((-b+Math.sqrt(D))/2/a).to_s
   else
      puts (-b/2/a).to_s+','+(Math.sqrt(-D)/2/a).to_s+','+(-b/2/a).to_s+','+(-Math.sqrt(-D)/2/a).to_s
   end
end
