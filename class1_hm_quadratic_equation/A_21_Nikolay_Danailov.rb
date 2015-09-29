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

	if d < 0
		puts "No real solutions"
	elsif d == 0
		puts "The solution is #{-b / (2*a)}"
	else
		puts "The first solution is #{(-b + Math.sqrt(d)) / 2*a}"
		puts "The second solution is #{(-b - Math.sqrt(d)) / 2*a}"
	end
end