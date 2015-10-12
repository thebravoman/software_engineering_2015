x = 0
until x > 0 && x < 10 do
  puts "Enter x:"
  x = gets.to_i
end

arr = Array.new(10)
multiplier = 1
for i in 0..9
  sum = 0
  for j in 0..999
    sum += j if j % (multiplier*x) == 0
  end
  arr[i] = sum
  multiplier += 1
end

p arr
