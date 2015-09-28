x = ARGV[0].to_i

if !(0 < x && x < 100)
  raise ArgumentError, "X must be between 0 and 100"
end

numbers = Array.new(10) { |i| x+i+1 }
odd_numbers = Array.new

for i in 0..numbers.length-1
  if numbers[i] % 2 == 1
    odd_numbers.push numbers[i]
  end
end

puts "Inital array:"
puts numbers

puts "Odd array:"
puts odd_numbers
