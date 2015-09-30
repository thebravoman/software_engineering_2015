x = 0
until x > 0 && x < 10 do
  puts "Enter x:"
  x = gets.to_i
end

arr = Array.new(10)

def fib(n)
  a, b = 0, 1
  n.times { a, b = b + a, a }
  a
end

num = 0
i = 0
while i < 10 do
  if fib(num) % 10 == x
    arr[i] = fib(num)
    i += 1
  end
  num += 1
end

p arr
