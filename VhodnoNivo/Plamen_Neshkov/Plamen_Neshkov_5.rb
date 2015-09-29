x = 0
until x > 0 && x < 10 do
  puts "Enter x:"
  x = gets.to_i
end

arr = Array.new(10)
i = 0
for i in 0..arr.size - 1 do
  arr[i] = Math.cos(i)
  i += 1
end

p arr

arr.sort!.reverse!
p arr
