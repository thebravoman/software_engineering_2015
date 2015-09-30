a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f
discriminant = b**2 - 4 * a * c

if a == 0
  x = -c/b
  puts "#{x}"
end

if discriminant == 0
  x = -b/2*a
  puts "#{x}"
elsif discriminant > 0
  x1 = (-b + Math.sqrt(discriminant)) / (2 * a)
  x2 = (-b - Math.sqrt(discriminant)) / (2 * a)

  if x1 < x2
    puts "#{x1},#{x2}"
  else
    puts "#{x2},#{x1}"
  end
end
