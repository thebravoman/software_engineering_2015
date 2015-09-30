if ARGV.size < 3
	puts "Not enough command line arguments!"
	exit
end

a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f

if a == 0
	puts "The solution is #{-c/b}"
else
	d = b**2 - 4*a*c

	if d == 0
		puts "#{-b / (2*a)}"
	elsif d > 0
		puts "#{(-b-Math.sqrt(d)) / 2*a},#{(-b+Math.sqrt(d)) / 2*a}"
	end
end
