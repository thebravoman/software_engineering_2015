x = 0
y = 0

loop do
  puts 'Enter two whole numbers, the first of which is smaller'

  x = gets.to_i
  y = gets.to_i

  break if x < y
end

sum = 0

(x..y).each do |i|
  sum += i if i % 17 == 0
end

puts sum
