require 'csv'

file = ARGV[0]
date_or_string = ARGV[1]
value = ARGV[2].to_i
v1 = value - 10
v2 = value + 10
sum = 0
csv = CSV.read file

if date_or_string != 'xml' && !date_or_string.include?("/") && date_or_string.to_a? String

	csv.each { |x|
		if date_or_string == x[1]
			puts x.join(',').to_s 
			sum += x[3]
		end
	}
	
	puts sum.to_i

else

	csv.each { |x|
		if x[0] == date_or_string
			if ARGV[2] == nil || ((x[3].to_i >= v1) && (x[3].to_i <= v2))
				puts x.join(',').to_s
			end
		end
	}

end
