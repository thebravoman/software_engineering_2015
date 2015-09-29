x = ARGV[0].to_i

if x > 0 && x < 10
  result = Array.new

  next_divisable = 0
  while result.size < 10
    loop do
      if next_divisable % x == 0
        break
      end

      next_divisable += 1
    end

    current_sum = (0..next_divisable).inject(:+)
    result.push(current_sum)

    next_divisable += 1
  end

  puts "#{result}"
else
  raise "Argument should be in the range 0 < x < 10."
end
