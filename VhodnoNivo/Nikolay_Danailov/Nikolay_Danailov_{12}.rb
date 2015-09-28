def count_planks(x, y, w, h)
	available_planks_by_x = x / w
	available_planks_by_y = y / h

	return available_planks_by_x * available_planks_by_y
end

x = 0
y = 0
w = 0
h = 0

loop do
	puts "Enter x, y, w and h, which are positive numbers"
	x = gets.to_i
	y = gets.to_i
	w = gets.to_i
	h = gets.to_i

	break if x > 0 and y > 0 and w > 0 and h > 0
end

planks_count = count_planks(x, y, w, h)
puts "#{planks_count} planks can be made"

if planks_count > 0
	arr = []

	current_x = w
	(0..9).each{ |i|
		if current_x >= x
			break
		end

		arr[i] = current_x
		current_x += w
	}

	puts "It should be cut in the following places: #{arr}"
end