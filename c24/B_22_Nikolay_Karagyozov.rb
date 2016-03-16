# 1. p = 17, q = 23
# 2. n = 391
# 3. phi(n) = 352
# 4.

def get_divisors(number)
  result = []
  for i in 1..number/2
    result.push(i) if number % i == 0
  end
  result.push(number)
  result
end

def get_gcd(first, second)
  first_divisors = get_divisors(first)
  second_divisors = get_divisors(second)

  gcd = first_divisors.first

  first_divisors.each do |first_div|
    second_divisors.each do |second_div|
      if first_div == second_div
        gcd = first_div if first_div > gcd
      end
    end
  end

  gcd
end

first_number = ARGV[0].to_i
second_number = ARGV[1].to_i

puts get_gcd(first_number, second_number)
