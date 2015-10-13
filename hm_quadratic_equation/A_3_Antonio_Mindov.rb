def solve (a, b, c)
	d = b*b - 4 * a * c

	if a == 0
		puts -b/c 
	elsif d < 0
			return nil
	elsif d == 0
		return (-b / (2.0 * a)).to_s
	else d > 0
		x1 = (Math.sqrt(d) - b) / (2 * a);
		x2 = (-b - Math.sqrt(d)) / (2 * a)

		if x1 < x2
			return x1.to_s + "," + x2.to_s
		else
			x2.to_s + "," + x1.to_s
		end
	end
end

a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f

solution = solve(a, b, c)

if solution != nil
	print solution
end