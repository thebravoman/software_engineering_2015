
number = ARGV[0].to_i

for i in 1..Math.sqrt(number)
  if(number % i == 0)
    puts i
  end
end
