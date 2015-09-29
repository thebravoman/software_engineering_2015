def fibonacci(n)
   n <= 1 ? n :  fibonacci( n - 1 ) + fibonacci( n - 2 )
end

x = gets.to_i
y = gets.to_i

for i in 1..y
  if fibonacci(i) >= x && fibonacci(i) <= y
    puts fibonacci(i)
  end
  if fibonacci(i) > y
    break
  end
end
