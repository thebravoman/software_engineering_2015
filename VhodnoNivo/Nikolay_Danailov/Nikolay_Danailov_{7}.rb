x = 0

loop do
  puts 'Enter a number between 1 and 100'
  x = gets.to_i

  break if x > 0 && x < 100
end

arr = []
arr2 = []

(0..9).each do |i|
  # must be bigger than x, but isn't said what the upper range is
  arr[i] = rand((x + 1)..200)
end

arr.each_with_index do |_i, index|
  arr2[arr2.size] = arr[index] if index.even?
end

puts arr
puts
puts arr2
