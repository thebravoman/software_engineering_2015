x = ARGV[0].to_i

def fibonacci(n)
  return n if ( 0..1 ).include? n
  (fibonacci(n - 1) + fibonacci(n - 2))
end

if !(0 <= x && x < 10)
  raise ArgumentError, "X must be between 0 and 10"
end

numbers = Array.new

index = 0
while numbers.length < 10
  current = fibonacci(index)

  if (current % x == 0)
    numbers.push current
  end

  index += 1
end

puts numbers
