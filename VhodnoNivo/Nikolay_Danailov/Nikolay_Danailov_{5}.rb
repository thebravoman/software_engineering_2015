x = 0

loop do
  puts 'Enter a number between 0 and 10'
  x = gets.to_i

  break if x > 0 && x < 10
end

arr = []

(0..9).each do |i|
  arr[i] = Math.cos(i)
end

arr.sort! { |a, b| b <=> a } # sort in descending order

puts arr
