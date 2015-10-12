require 'cmath'

a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

d = (b ** 2) - (4*a*c)

if ( d >= 0 )

	Root1 = (-b + Math.sqrt(d) ) / (2 * a)
	Root2 = (-b - Math.sqrt(d) ) / (2 * a)

	if (Root1 == Root2)
	puts Root1
	end
	if (Root1 > Root2)
	puts ("#{Root2},#{Root1}")
	end
	if (Root1 < Root2)
	puts ("#{Root1},#{Root2}")
	end

else
puts "No real roots."
end