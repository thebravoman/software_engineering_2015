a = ARGV[0]
b = ARGV[1]
c = ARGV[2]
a = a.to_i()
b = b.to_i()
c = c.to_i()

D = (b*b) - (4*a*c)

if (D < 0)
		puts "there are no solutions!"
end

if (D == 0)
		x = (-b)/(2*a)
		puts "#{x}"
end

if (D > 0)
		x1 = ((-b)+Math.sqrt(D))/(2*a)
		x2 = ((-b)-Math.sqrt(D))/(2*a)
		puts "#{x1},#{x2}"
end
