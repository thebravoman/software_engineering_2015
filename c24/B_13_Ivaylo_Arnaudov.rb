def get_divisors(n)
  divisors = []
  (1..n).each do |i|
    if n % i == 0
      divisors.push(i)
    end
  end

  return divisors
end

def gcd(a, b)
  if b == 0
    return a
  end
  r = a % b
  return gcd(b, r)
end

n = ARGV[0].to_i
puts "#{get_divisors(n)}"

a, b = ARGV[1].to_i, ARGV[2].to_i
gcd = gcd(a, b)
puts "#{gcd}"
