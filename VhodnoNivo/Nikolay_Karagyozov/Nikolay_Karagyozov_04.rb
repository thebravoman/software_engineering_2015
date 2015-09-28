def is_perfect_square?(number)
  sqrt_number = Math.sqrt(number).floor
  return sqrt_number**2 == number
end

def is_fibonacci_number?(number)
  first_condition = 5 * number**2 + 4
  second_condition = 5 * number**2 - 4

  if (is_perfect_square?(first_condition) ||
      is_perfect_square?(second_condition))
      return true
  end

  return false
end

x = ARGV[0].to_i
y = ARGV[1].to_i

if !(x < y)
  raise ArgumentError, "X must be smaller than Y."
end

for i in x..y
  if is_fibonacci_number?(i)
    puts i
  end
end
