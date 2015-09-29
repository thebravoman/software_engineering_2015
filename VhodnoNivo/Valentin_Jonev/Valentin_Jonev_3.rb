require 'prime'

x = gets.to_i
y = gets.to_i

for i in x..y
  if i % 10 == 3
    if Prime.prime?(i)
      puts i
    end
  end
end
