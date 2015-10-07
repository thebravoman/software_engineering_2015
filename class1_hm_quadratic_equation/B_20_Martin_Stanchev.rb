a = ARGV[0].to_i()
b = ARGV[1].to_i()
c = ARGV[2].to_i()


if a == 0
  puts "Equation is not quadric"
else
  D = b**2 - 4*a*c
end
if D < 0
  puts "It can not be solved"
elsif D > 0
  x1 = ((-b) + Math.sqrt(D)) / (2*a)
  x2 = ((-b) - Math.sqrt(D)) / (2*a)
  
  if x2 > x1
    puts "#{x1},#{x2}"
  else puts "#{x2},#{x1}"
  end
  
  elsif D == 0
  x = (-b) / (2*a)
  puts x
end
  
