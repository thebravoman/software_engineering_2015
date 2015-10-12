x = 0

loop do
	puts "Enter a number between 0 and 10"
	x = gets.to_i

	break if x > 0 and x < 10
end

arr = []

(0..9).each{ |i|
	arr[i] = Math::cos(i)
}

arr.sort! { |x, y| y <=> x } #sort in descending order

puts arr