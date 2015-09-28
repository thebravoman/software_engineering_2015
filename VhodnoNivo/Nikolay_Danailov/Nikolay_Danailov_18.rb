require 'prime'

x = 0

loop do
	puts "Enter a number that is equal to 0 or bigger"
	x = gets.to_i

	break if x >= 0
end

dividers = []

curr_num = 1
while dividers.size < 10 and curr_num < x
	if x % curr_num == 0
		if curr_num % 2 != 0
			dividers[dividers.size] = curr_num
		end
	end

	curr_num += 1
end

puts "Dividers: #{dividers}"

prime_dividers = []
dividers.each{ |div|
	if Prime.prime?(div)
		prime_dividers[prime_dividers.size] = div
	end
}

puts "Prime dividers: #{prime_dividers}"