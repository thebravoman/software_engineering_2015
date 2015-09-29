x = ARGV[0].to_i

def custom_sort(a, b, x)
  a_end = a % 10
  b_end = b % 10

  if a_end == x && b_end == x
    return 0
  elsif a_end == x
    return -1
  else b_end == x
    return 1
  end

  return 0
end

if !(0 < x && x < 10)
  raise ArgumentError, "X must be between 0 and 10"
end

random_gen = Random.new
numbers = Array.new(x*10) { |i| random_gen.rand(0..100) }
numbers.sort! { |a, b| custom_sort(a, b, x) }

puts numbers
