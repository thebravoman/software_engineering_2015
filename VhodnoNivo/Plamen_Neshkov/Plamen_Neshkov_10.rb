x = -1
until x >= 0 && x < 100 do
  puts "Enter x:"
  x = gets.to_i
end

arr = Array.new(10)

def fib(n)
  a, b = 0, 1
  n.times { a, b = b + a, a }
  a
end

elem = 0
i = 0
while elem < 10 do
  if fib(i) % x == 0
    arr[elem] = fib(i)
    elem += 1
  end
  i += 1
end

p arr
