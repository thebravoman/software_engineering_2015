# 1. p = 17, q = 23
# 2. n = 391
# 3. phi(n) = 352
# 4. e = 117
# 5. d = 349, 701

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

def get_modular_multiplicative_inverse(a, n)
  t = 0
  nt = 1
  r = n
  nr = a % n

  n = -n if n < 0
	a = n - (-a % n) if a < 0

  while nr != 0
    quot = (r / nr) | 0;
    tmp = nt
    nt = t - quot * nt
    t = tmp
    tmp = nr
    nr = r - quot * nr
    r = tmp
  end

  return -1 if r > 1

  t += n if t < 0
  return t;
end

first_number = ARGV[0].to_i
second_number = ARGV[1].to_i

puts 29 ** 117 % 391
puts 3 ** 349 % 391
