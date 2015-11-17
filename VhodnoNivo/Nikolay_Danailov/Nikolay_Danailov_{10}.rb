x = 0

loop do
  puts 'Enter a number between 0 and 10'
  x = gets.to_i

  # 0 should be included, but I can't divide by zero
  break if x > 0 && x <= 10
end

arr = []

num1 = 0
num2 = 1
num3 = 0

while arr.size < 10
  arr[arr.size] = num3

  num1 = num2
  num2 = num3
  num3 = num1 + num2
end

puts arr
