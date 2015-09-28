def isPrime(number)
  for i in 2..Math.sqrt(number)
    if number % i == 0
      return false
    end
  end

  return true
end

def endsInThree(number)
  return number % 10 == 3
end

x = ARGV[0].to_i
y = ARGV[1].to_i

if !(x < y)
  raise ArgumentError, "X must be smaller than Y."
end

for i in x..y
  if isPrime(i) && endsInThree(i)
    puts i
  end
end
