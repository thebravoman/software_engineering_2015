x = gets.to_i
y = gets.to_i

sum = 0

for i in x..y
  if i % 17 == 0
    sum += i
  end
end

puts sum
