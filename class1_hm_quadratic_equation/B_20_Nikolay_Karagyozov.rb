a = ARGV[0].to_f
b = ARGV[1].to_f
c = ARGV[2].to_f
discriminant = b**2 - 4 * a * c

if a == 0
  x = b/c
  p "#{x}"
end

if discriminant == 0
  x = -b/2*a
  p "#{x}"
elsif discriminant > 0
  x1 = (-b + Math.sqrt(discriminant)) / (2 * a)
  x2 = (-b - Math.sqrt(discriminant)) / (2 * a)

  if x1 < x2
    p "#{x1},#{x2}"
  else
    p "#{x2},#{x1}"
  end
end
