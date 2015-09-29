x = ARGV[0].to_i

def get_third_digit(n)
  fraction = n.to_s.split('.')[1]
  return fraction[2].to_i
end

if !(0 <= x && x < 10)
  raise ArgumentError, "X must be between 0 and 10"
end

numbers = Array.new
index = 0;
while numbers.length < 10
  cos = Math.cos(index)
  if cos > 0
    digit = get_third_digit(cos)

    if digit == x
      numbers.push(cos)
    end
  end

  index += 1
end

puts numbers
