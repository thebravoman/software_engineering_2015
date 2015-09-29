x = 0
y = 0

until x < y
  puts "Enter x:"
  x = gets.to_i
  puts "Enter y:"
  y = gets.to_i
end

def fib(n)
  a, b = 0, 1
  n.times { a, b = b + a, a }
  a
end

for i in x..y
  puts fib(i)
end
