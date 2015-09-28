x = 0
until x > 0 && x < 100 do
  puts "Enter x:"
  x = gets.to_i
end

arr = Array.new(10)
result = Array.new(5)
for i in 0..arr.size - 1 do
  arr[i] = i + x + 1;
  result[i/2] = arr[i] if i % 2 == 1
end

p result
