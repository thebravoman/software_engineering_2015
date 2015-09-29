require 'prime'

x = -1
until x > 0 && x < 1
  puts "Enter x:"
  x = gets.to_f
end

ratio = 1.0
first = 2.0
second = -1.0

while ratio >= x
  puts ratio
  if Prime.prime?(first)
    if second == first - 2
      ratio = (1 / first) + (1 / second)
    end
    second = first
  end
  first += 1
end
