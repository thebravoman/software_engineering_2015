x = 0
until x > 0 && x < 100 do
  puts "Enter x:"
  x = gets.to_i
end

arr = Array.new(10)
even_elem = 0
for i in 0..arr.size - 1 do
  arr[i] = i + x + 1;
  even_elem += 1 if arr[i] % 2 == 1
end

result = Array.new(even_elem)
i = 0
arr.each do |elem|
  if elem % 2 == 1
    result[i] = elem
    i += 1
  end
end

p result
