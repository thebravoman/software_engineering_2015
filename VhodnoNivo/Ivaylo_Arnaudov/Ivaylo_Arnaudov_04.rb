# Reference:
# https://en.wikipedia.org/wiki/Fibonacci_number#Recognizing_Fibonacci_numbers

def is_perfect_square?(n)
  square_root = Math::sqrt(n).to_i
  square_root * square_root == n
end

def is_fibonacci?(n)
  is_perfect_square?(5 * n * n + 4) || is_perfect_square?(5 * n * n - 4)
end

x = ARGV[0].to_i
y = ARGV[1].to_i

if x < y
  (x..y).each do |n|
    if is_fibonacci?(n)
      puts n
    end
  end
else
  raise "First argument should be smaller than the second."
end
