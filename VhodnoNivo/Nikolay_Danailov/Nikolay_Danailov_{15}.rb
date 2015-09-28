x = 0

loop do
	puts "Enter a number between 0 and 10"
	x = gets.to_i

	break if x > 0 and x < 10
end

arr = []

(0..9).each{ |i|
	arr[i] = 0

	(1..999).each{ |j|
		if j % (x * (i + 1)) == 0
			arr[i] += j
		end
	}
}

puts arr