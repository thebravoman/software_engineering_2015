x = ARGV[0].to_f

if x > 0 && x < 1
  result = 4
  current_divisor = 3.0
  i = 1

  loop do
    next_subtrahend = 4 / current_divisor

    if next_subtrahend < x
      break
    end

    if i.even?
      result += next_subtrahend
    else
      result -= next_subtrahend
    end

    current_divisor += 2
    i += 1
  end

  puts result
else
  raise "Argument should be in the range 0 <= x < 10."
end
