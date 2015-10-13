#!/usr/bin/ruby

def solve(a, b, c)
  discriminant = (b ** 2) - (4 * a * c)
  if discriminant == 0
    return -b / (2 * a)
  elsif discriminant > 0
    x1 = (-b + Math.sqrt(discriminant)) / (2 * a)
    x2 = (-b - Math.sqrt(discriminant)) / (2 * a)
    return "#{x1}, #{x2}"
  end
  return ""
end

a = ARGV[0].to_i
b = ARGV[1].to_i
c = ARGV[2].to_i

puts solve(a, b, c)
