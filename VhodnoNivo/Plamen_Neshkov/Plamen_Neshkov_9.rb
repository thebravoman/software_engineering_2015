x = -1
until x >= 0 && x < 100 do
  puts "Enter x:"
  x = gets.to_i
end

arr = Array.new(10)
elem = 0
i = 0
while elem < 10 do
  value = Math.cos(i)
  abs_value = value.abs.to_s
  if abs_value[4].to_i == x
    arr[elem] = value
    elem += 1
  end
  i += 1
end

p arr
