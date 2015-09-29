x = 0
y = 0

until x < y
  puts "Enter x:"
  x = gets.to_i
  puts "Enter y:"
  y = gets.to_i
end
for i in x..y 
  prime = true
  for j in 2..Math.sqrt(i)
    if i % j == 0
      prime = false
    end
  end
  puts i if i % 10 == 3 && prime
end
