def sum_negatives_in_range(x, y)
  (x..y).inject(0) { |sum, n| n.odd? ? sum + n : sum }
end

x = ARGV[0].to_i
y = ARGV[1].to_i

if x < y
  puts sum_negatives_in_range(x, y)
else
  raise "First argument should be smaller than the second."
end
