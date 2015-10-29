require 'prime'

x = 0

loop do
  puts 'Enter a number between 0 and 1'
  x = gets.to_f

  break if x > 0 && x < 1
end

ratio = 1.0
i = 5.0 # second number of first twin primes
last_prime = 3.0 # first number of first twin primes

while ratio > x
  if Prime.prime?(i)
    ratio = 1 / i + 1 / last_prime if last_prime == i - 2

    last_prime = i
  end

  i += 1
end

puts ratio
