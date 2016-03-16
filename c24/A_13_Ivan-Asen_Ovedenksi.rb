devided_num = ARGV[0].to_i 
counter = 1

while counter != devided_num do 
 	if devided_num % counter == 0
		puts counter
	end
	counter = counter + 1
end