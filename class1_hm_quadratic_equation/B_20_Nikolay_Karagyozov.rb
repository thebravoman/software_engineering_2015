a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f
discriminant = b ** 2 - 4 * a * c

if a <= 0
  x = b/c
  puts "x = #{x}"
end

if discriminant < 0
  puts "No real roots."
elsif discriminant == 0
  x = -b/2*a
  puts "x1 = x2 = #{x}"
else
  x1 = (-b + Math.sqrt(discriminant)) / (2 * a)
  x2 = (-b - Math.sqrt(discriminant)) / (2 * a)

  puts "x1 = #{x1}"
  puts "x2 = #{x2}"
end
