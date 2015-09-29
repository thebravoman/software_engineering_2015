x = ARGV[0].to_i

if x > 0 && x < 10
  result = Array.new
  (0...10).each do |n|
    current_range_start = n * x
    current_range_end = (n + 1) * x

    current_range_cosines_sum = 0
    (current_range_start...current_range_end).each do |n|
      current_range_cosines_sum += Math::cos(n)
    end

    result[n] = current_range_cosines_sum
  end

  puts "#{result}"
else
  raise "Argument should be in the range 0 < x < 10."
end
