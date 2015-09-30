x = ARGV[0].to_i

def is_prime(number)
  for i in 2..Math.sqrt(number)
    if number % i == 0
      return false
    end
  end

  return true
end

if x < 0
  raise ArgumentError, "X must be positive or zero."
end

odd_numbers_list = Array.new

odd_number = 1;
while odd_numbers_list.length < 10
  if x % odd_number == 0
    odd_numbers_list.push odd_number
  end

  odd_number += 2;
end

puts "Before:"
puts odd_numbers_list

primes = Array.new
for i in 2..odd_numbers_list.length-1
  if is_prime(i)
    primes.push i
  end
end
puts "Only primes:"
puts primes
