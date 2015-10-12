x = 0
y = 0

until x < y  
  puts "Enter x:"
  x = gets.to_i
  puts "Enter y:"
  y = gets.to_i
  break if x < y
end
sum = 0
for i in x..y
  sum += i unless i % 2 == 0
end
puts sum
