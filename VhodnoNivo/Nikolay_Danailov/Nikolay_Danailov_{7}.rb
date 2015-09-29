x = 0

loop do
	puts "Enter a number between 1 and 100"
	x = gets.to_i

	break if x > 0 and x < 100
end

arr = []
arr2 = []

(0..9).each{ |i|
	arr[i] = rand((x + 1)..200) #must be bigger than x, but isn't said what the upper range is
}

arr.each_with_index{ |i, index|
	if index % 2 == 0
		arr2[arr2.size] = arr[index]
	end
}

puts arr
puts
puts arr2