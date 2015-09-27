x = 0
until x > 0 && x < 10 do
  puts "Enter x:"
  x = gets.to_i
end

arr = Array.new(10)

n = 0
while n < 10 do
  sum = 0.0
  for z in n * x..(n + 1) * x - 1
    sum += Math.cos(z)
    z += 1
  end
  arr[n] = sum
  n += 1
end

p arr
