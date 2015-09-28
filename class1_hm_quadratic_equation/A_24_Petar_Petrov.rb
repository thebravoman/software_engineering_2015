a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

discriminant = b**2 - 4*a*c
if discriminant < 0 || a == 0
    puts "There's no solution!"
elsif discriminant > 0
    x1 = (-b + Math.sqrt(discriminant)) / (2 * a)
    x2 = (-b - Math.sqrt(discriminant)) / (2 * a)
    puts "x1 = #{x1}, x2 = #{x2}"
else
    x1 = -b/(2 * a)
    puts "x1 = #{x1}"
end
