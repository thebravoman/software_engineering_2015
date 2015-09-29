require 'prime'

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

if x != 5 and x % 2 != 0
	curr_num = 1
	while arr.size < 10
		if Prime.prime?(curr_num)
			if get_last_digit(curr_num) == x.to_s
				arr[arr.size] = curr_num
			end
		end

		curr_num += 1
	end

	puts arr
else
	puts "No prime numbers end in that number"
end