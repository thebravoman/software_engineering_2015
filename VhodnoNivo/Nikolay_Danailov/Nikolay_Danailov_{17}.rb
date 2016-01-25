def get_last_digit(num)
	return num.to_s[num.to_s.length - 1]
end

x = 0

loop do
	puts "Enter a number between 0 and 10"
	x = gets.to_i

	break if x > 0 and x < 10
end

arr = []

num1 = 0
num2 = 1
num3 = 0

while arr.size < 10
	if get_last_digit(num3) == x.to_s
		arr[arr.size] = num3
	end

	num1 = num2
	num2 = num3
	num3 = num1 + num2
end

puts arr