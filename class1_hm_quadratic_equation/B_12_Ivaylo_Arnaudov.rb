a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f


if a == 0
  raise "Not a quadratic equation."
end

d = b ** 2 - 4 * a * c

if d < 0
  puts "Roots are complex numbers."
elsif d == 0
  root = -b / (2 * a)
  puts "x1 = x2 = #{root}"
else
  first_root = (-b + Math::sqrt(d)) / (2 * a)
  second_root = (-b - Math::sqrt(d)) / (2 * a)
  puts "x1 = #{first_root}; x2 = #{second_root}"
end
