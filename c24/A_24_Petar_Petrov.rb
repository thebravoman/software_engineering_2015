num = ARGV[0].to_i
counter = 2
until counter >= num do
	if num % counter == 0
		puts counter
	end
	counter = counter + 1
end
