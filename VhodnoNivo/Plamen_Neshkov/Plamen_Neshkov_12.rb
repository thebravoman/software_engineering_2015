x = 0
y = 0
w = 0
h = 0
until x > 0 && y > 0 && w > 0 && h > 0
  puts "Enter x:"
  x = gets.to_f
  puts "Enter y:"
  y = gets.to_f
  puts "Enter w:"
  w = gets.to_f
  puts "Enter h:"
  h = gets.to_f
end

x_many = (x / w).truncate
y_many = (y / h).truncate
count = x_many * y_many

puts "You can cut " + count.to_s + " boards out of the big one."

arr = Array.new(10)
curr_x = 0
i = 0
while curr_x < x do
  arr[i] = curr_x
  curr_x += w
  i += 1
end

p arr
