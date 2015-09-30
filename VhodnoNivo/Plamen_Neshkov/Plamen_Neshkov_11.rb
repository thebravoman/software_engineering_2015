x = 0
until x > 0 && x < 1 do
  puts "Enter x:"
  x = gets.to_f
end

divisor = 3.0
sign = "minus"
result = 4.0

curr = 1.0
while curr >= x do
  curr = 4/divisor
  if sign == "minus"
    result -= curr
    sign = "plus"
  else
    result += curr
    sign = "minus"
  end
  divisor += 2
end

puts result
