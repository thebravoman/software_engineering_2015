first_input_number = ARGV[0].to_i
second_input_number = ARGV[1].to_i

def gcd(first_number, second_number)

	return first_number.gcd(second_number)
	
end

def number_e(first_number, second_number)
	counter = first_number + 1

	while counter < second_number
		if (counter.gcd(second_number)) == 1
			puts counter
		end

		counter += 1
	end

	return nil
end

#puts gcd(first_input_number, second_input_number)
number_e(first_input_number, second_input_number)

=begin
while i <= Math.sqrt(input_number)
	if input_number % i == 0
		puts i
	end

	i += 1
end
=end