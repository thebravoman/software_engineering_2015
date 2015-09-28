require 'prime'

x = ARGV[0].to_i

if x >= 0
  odd_divisors = Array.new
  current_divisor = 1
  while odd_divisors.size < 10 && current_divisor < x
    if x % current_divisor == 0 && current_divisor.odd?
      odd_divisors.push(current_divisor)
    end

    current_divisor += 1
  end

  prime_odd_divisors = odd_divisors.select { |n| Prime.prime?(n) }

  puts "#{odd_divisors}"
  puts "#{prime_odd_divisors}"
else
  raise "Argument should be in the range [0; +inf]"
end
