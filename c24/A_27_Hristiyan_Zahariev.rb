entered_number = gets.chomp.to_i
i = 1

arr = []

while i <= entered_number do
	
	if entered_number % i == 0
		puts i
	end

	arr[i] 

	i = i + 1	
end
