enter_num = gets.chomp.to_i
i = 2

while i <= enter_num do 
	if enter_num % i == 0
		puts i
	end
	i = i + 1
end 
