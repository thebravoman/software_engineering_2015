x = 0
until x > 0 && x < 10 do
  puts "Enter x:"
  x = gets.to_i
end

arr = Array.new(10)

i = 2
n = 0
while n < 10
  prime = true
  for j in 2..Math.sqrt(i)
    if i % j == 0
      prime = false
    end
  end
  if prime && (i % 10) == x
    arr[n] = i
    n += 1
  end
  i += 1
end

p arr
