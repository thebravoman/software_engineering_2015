x = ARGV[0].to_i

if x > 0 && x < 100
  numbers = Array.new(10)

  x += 1
  numbers_bigger_than_x = numbers.each.with_index do |n, i|
    numbers[i] = x + i
  end

  odd_numbers = numbers_bigger_than_x.select { |n| n.odd? }
  puts "#{odd_numbers}"
else
  raise "Argument should be in the range 0 < x < 100."
end
