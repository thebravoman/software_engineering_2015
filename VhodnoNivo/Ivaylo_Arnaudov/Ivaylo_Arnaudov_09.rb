def get_third_digit(n)
  fractional_part = n.to_s.split('.')[1]
  fractional_part[2].to_i
end

x = ARGV[0].to_i

if x >= 0 && x < 10
  numbers = Array.new
  i = 0;
  while numbers.size < 10
    cosine = Math::cos(i)

    if cosine > 0
      third_digit = get_third_digit(cosine)

      if third_digit == x
        numbers.push(cosine)
      end
    end

    i += 1
  end

  puts "#{numbers}"
else
  raise "Argument should be in the range 0 <= x < 10."
end
