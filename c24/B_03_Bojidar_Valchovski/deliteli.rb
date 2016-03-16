n = gets.chomp.to_i
i = 1

while i <= n do
	if n % i == 0
		puts i
	end
	i = i + 1
end
