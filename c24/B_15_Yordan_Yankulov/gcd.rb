def gcd(u, v)
  u, v = u.abs, v.abs
  while v > 0
    u, v = v, u % v
  end
  u
end

number = ARGV[0].to_i
number1 = ARGV[1].to_i
puts gcd(number, number1)
