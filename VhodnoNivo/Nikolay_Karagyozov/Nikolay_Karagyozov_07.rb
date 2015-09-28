x = ARGV[0].to_i

if !(0 < x && x < 100)
  raise ArgumentError, "X must be between 0 and 100"
end

numbers = Array.new(10) { |i| x+i+1 }
hop_numbers = Array.new

for i in (0..9).step(2)
  hop_numbers.push numbers[i]
end

puts "Inital array:"
puts numbers

puts "Hop array:"
puts hop_numbers
