x = 0

loop do
  puts 'Enter a number between 0 and 10'
  x = gets.to_i

  break if x > 0 && x < 10
end

arr = []

(0..9).each do |i|
  arr[i] = 0

  (1..999).each do |j|
    arr[i] += j if j % (x * (i + 1)) == 0
  end
end

puts arr
