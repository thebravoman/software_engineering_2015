x = 0

loop do
  puts 'Enter a number between 0 and 10'
  x = gets.to_i

  break if x > 0 && x < 10
end

arr = []

(0..9).each do |i|
  current_range_bottom = i * x
  current_range_top = (i + 1) * x
  sum = 0

  (current_range_bottom..(current_range_top - 1)).each do |j|
    sum += Math.cos(j)
  end

  arr[i] = sum
end

puts arr
