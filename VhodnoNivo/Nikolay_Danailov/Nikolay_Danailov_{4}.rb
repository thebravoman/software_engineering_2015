x = 0
y = 0

loop do
  puts 'Enter two whole numbers, the first of which is smaller'

  x = gets.to_i
  y = gets.to_i

  break if x < y
end

num1 = 0
num2 = 1
num3 = 0

while num3 <= y
  puts num3 if num3 >= x

  num1 = num2
  num2 = num3
  num3 = num1 + num2
end
