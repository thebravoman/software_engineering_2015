x = ARGV[0].to_i

if !(0 < x && x < 10)
  raise ArgumentError, "X must be between 0 and 10"
end

numbers = Array.new(x) {|i| Math.cos(i) }

puts "Before: "
puts numbers

numbers.sort!.reverse!

puts "After: "
puts numbers
