def sum_divisable_by_17_in_range(x, y)
  (x..y).inject(0) { |sum, n| n % 17 == 0 ? sum + n : sum }
end

x = ARGV[0].to_i
y = ARGV[1].to_i

if x < y
  puts sum_divisable_by_17_in_range(x, y)
else
  raise "First argument should be smaller than the second."
end
