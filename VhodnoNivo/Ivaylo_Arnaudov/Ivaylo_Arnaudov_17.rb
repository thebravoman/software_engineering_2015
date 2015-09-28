x = ARGV[0].to_i

if x > 0 && x < 10
  result = Array.new
  first, second = 0, 1
  while result.size < 10
    if first % 10 == x
      result.push(first)
    end

    first, second = second, first + second
  end

  puts "#{result}"
else
  raise "Argument should be in the range 0 < x < 10."
end
