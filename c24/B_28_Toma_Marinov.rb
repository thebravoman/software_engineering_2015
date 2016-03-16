input_number = ARGV[0].to_i

i = 1;

while i <= Math.sqrt(input_number)
	if input_number % i == 0
		puts i
	end

	i += 1
end