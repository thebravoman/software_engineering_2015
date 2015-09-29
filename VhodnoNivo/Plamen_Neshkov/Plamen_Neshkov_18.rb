x = -1
until x >= 0
  puts "Enter x:"
  x = gets.to_i
end

arr = Array.new(10)
elem = 0
i = 1
while elem < 10 do
  if x % i == 0
    arr[elem] = i
    elem += 1
  end
  i += 1
  if x != 0 && i > x
    break
  end
end

p arr

i = 0
while arr[i] != nil
  prime = true
  for j in 2..Math.sqrt(arr[i])
    if arr[i] % j == 0
      prime = false
    end
  end
  if prime
    puts "#{arr[i]} is prime."
  end
  i += 1
end
