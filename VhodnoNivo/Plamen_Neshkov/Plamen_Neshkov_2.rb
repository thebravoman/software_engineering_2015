x = 0
y = 0

until x < y  
  puts "Enter x:"
  x = gets.to_i
  puts "Enter y:"
  y = gets.to_i
end
sum = 0
for i in x..y 
  sum += i if i % 17 == 0
end
puts sum
