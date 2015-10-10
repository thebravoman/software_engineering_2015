A = ARGV[0].to_f
B = ARGV[1].to_f
C = ARGV[2].to_f	
D = B*B - 4*A*C # diskriminanta 
if (D == 0) #edin koren
	x0 = (-B) / (2*A)
	puts "#{x0}"
else
	if (D > 0) #dva korena
	x1 = (-B-Math.sqrt(D)) / (2*A)
	x2 = (-B+Math.sqrt(D)) / (2*A)
	puts "#{x1},#{x2}" # #{}-taka se izvejda promenliva
	else
	puts 'D < 0' # D< 0 nqma koreni
     	end
end
