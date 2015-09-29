x = ARGV[0].to_i

if x > 0 && x < 10
  random_numbers = Array.new(100);
  random = Random.new
  random_numbers.map! { |n| random.rand(0..99) }
  sorted_random_numbers = random_numbers.sort_by { |n| n % 10 == x ? 0 : 1 }
  puts "#{sorted_random_numbers}"
else
  raise "Argument should be in the range 0 < x < 10."
end
