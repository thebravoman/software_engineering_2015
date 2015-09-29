x = 0
until x > 0 && x < 10 do
  puts "Enter x:"
  x = gets.to_i
end

arr = Array.new(10)
elem = 0
n = 0
while elem < 10 do
  if n % x == 0
    sum = 0
    for i in 0..n
      sum += i
    end
    arr[elem] = sum
    elem += 1
  end
  n += 1
end

p arr
