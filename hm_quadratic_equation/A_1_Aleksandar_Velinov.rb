a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f

if (a == 0)
	puts "#{-c/b}"
	return
end

D = b*b - 4*a*c

if (D == 0)
	puts "#{-b/(2*a)}"
end

if (D > 0)
	x1 = ((-b-Math.sqrt(D))/2*a)
	x2 = ((-b+Math.sqrt(D))/2*a)
	puts "#{[x1, x2].min},#{[x1, x2].max}"
end

if (D < 0)
	puts 'Nqma realni koreni'
end
