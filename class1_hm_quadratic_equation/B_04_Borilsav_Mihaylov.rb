a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

d = b**2 - 4 * a * c

if (d == 0)

	puts -b/2*a

elsif d < 0
	
	puts "No solution!"

else d > 0

	x1 = (-b + Math.sqrt((b ** 2) - (4 * a * c)) ) / (2 * a)
	x2 = (-b - Math.sqrt((b ** 2) - (4 * a * c)) ) / (2 * a)
end 	

printf("%.2f,%.2f\n", x1, x2)
