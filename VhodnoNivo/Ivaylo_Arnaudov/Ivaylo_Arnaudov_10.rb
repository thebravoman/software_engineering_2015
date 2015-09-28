x = ARGV[0].to_i

if x >= 0 && x < 10
  numbers = Array.new

  i, j = 0, 1
  while numbers.size < 10
    if i % x == 0
      numbers.push(i)
    end

    i, j = j, i + j
  end

  puts "#{numbers}"
else
  raise "Argument should be in the range 0 <= x < 10."
end
