а = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

fRoot1 = (-b + Math.sqrt((b ** 2) - (4 * a * c)) ) / (2 * a)
fRoot2 = (-b - Math.sqrt((b ** 2) - (4 * a * c)) ) / (2 * a)

if(fRoot1 == fRoot2)
puts fRoot1
else
if(fRoot1 < fRoot2)
puts("#{fRoot1},#{fRoot2}")
else
puts("#{fRoot2},#{fRoot1}")
end
end
