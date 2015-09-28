def solve (a, b, c)
	d = b**2 - 4 * a * c

	if a < 0
		puts -b/c 
	elsif d < 0
			return "There is no rational solution"
	elsif d == 0
		return "x1 = "+ (-b / (2.0 * a)).to_s
	else d > 0
		return "x1 = "+ (-b + Math.sqrt(d) / (2 * a)).to_s + "\nx2 = "+ (-b - Math.sqrt(d) / (2 * a)).to_s
		puts 
	end
end

a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

puts solve(a, b, c)