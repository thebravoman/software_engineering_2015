a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f

if a == 0
  raise "Not a quadratic equation."
end

d = b**2 - 4 * a * c

if d > 0
  x1 = (-b + Math.sqrt(d)) / 2 * a
  x2 = (-b - Math.sqrt(d)) / 2 * a
  puts "#{x1}, #{x2}"
elsif d == 0
  x = (-b - Math.sqrt(d)) / 2 * a
  puts x
else
  puts "No real roots."
end
