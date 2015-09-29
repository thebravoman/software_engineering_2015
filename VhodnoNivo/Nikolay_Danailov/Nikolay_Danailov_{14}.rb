#get "count"-th divisable of the divident
#count starts from 0
def find_divisable(divident, count) 
	return divident * count
end

def find_sum(last_num)
	sum = 0

	(1..last_num).each{ |i|
		sum += i
	}

	return sum
end

x = 0

loop do
	puts "Enter a number between 0 and 10"
	x = gets.to_i

	break if x > 0 and x < 10
end

arr = []

(0..9).each{ |i|
	n = find_divisable(x, i)
	arr[i] = find_sum(n)
}

puts arr