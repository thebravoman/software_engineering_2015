a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

D =  (b*b) - (4*a*c)


	if D > 0 then
		puts "#{(-b + Math.sqrt(D))/2*a}, #{(-b - Math.sqrt(D))/2*a}"
 
	elsif D == 0 then
	puts "#{-b/2*a}"

	else
		puts "equation has no roots"

end
puts " "
