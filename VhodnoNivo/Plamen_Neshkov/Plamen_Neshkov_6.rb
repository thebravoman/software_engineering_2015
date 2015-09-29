x = 0
until x > 0 && x < 10 do
  puts "Enter x:"
  x = gets.to_i
end

arr = Array.new(100)
for i in 0..arr.size - 1 do
  arr[i] = rand(100)
end

curr = 0
for i in 0..arr.size - 1 do
  if arr[i] % 10 == x
    temp = arr[i]
    arr[i] = arr[curr]
    arr[curr] = temp
    curr += 1
  end
end

p arr
