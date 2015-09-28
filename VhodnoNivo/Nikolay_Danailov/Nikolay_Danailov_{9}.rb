def get_third_digit(num)
	fractial_part = num.to_s.split('.')[1]
	return fractial_part[2].to_i
end

puts "Enter a number between 0 and 10"
x = gets.to_i
arr = []

i = 0
while arr.size < 10
	cosine = Math::cos(i)

	third_digit = get_third_digit(cosine)

	if third_digit == x
		arr[arr.size] = cosine
	end

	i += 1
end

puts arr