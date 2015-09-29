puts "Enter a number between 0 and 1"
x = gets.to_f

res = 4
i = 3.0
j = 1

while true
	calculated_num = 4 / i

	break if calculated_num < x

	if j % 2 == 0
		res += calculated_num
	else
		res -= calculated_num
	end

	i += 2
	j += 1
end

puts res