# 1. p = 17, q = 23
# 2. n = 391
# 3. phi(n) = 352
# 4.

def get_divisors(number)
	result = []

  	for counter in 1..number / 2
    	result.push(counter) if number % counter == 0
  	end

  	result.push(number)
  	result
end

def get_gcd(first, second)

  	first_divisors = get_divisors(first)
 	second_divisors = get_divisors(second)

  	gcd = first_divisors.first

  	first_divisors.each do |first_div|
  		
    	second_divisors.each do |second_div|
      		if first_div == second_div
        		gcd = first_div if first_div > gcd
      	end
    end
  end

  gcd

end

number1 = ARGV[0].to_i
number2 = ARGV[1].to_i

puts get_gcd(number1, number2)