require 'csv'

file_name = ARGV[0]
date = ARGV[1]
value = ARGV[2].to_i
value_1 = value + 10
value_2 = value - 10
string = []
sum = 0

def date? date
	/\d{1,2}\/{1,2}\/\d*/.match date	
end
def sum? sum
	if sum != 0
		puts sum
	end
end

csv_file = CSV.read file_name

csv_file.each do |line| 
			if !date? (date)
				if ARGV[2] != nil 
					if 	line[0] == date
						if (line[3].to_i <= value_1) and (line[3].to_i >= value_2) and line[0] == date
							string<< line.join(",").to_s
						end
					end
				end	
		  		elsif ARGV[2] == nil
		  			if line[0] == date
		 				string<< line.join(",").to_s		   			
		  			end
		   			elsif line[1] == date
		   				string<< line.join(",").to_s
		   				sum += line[3].to_i		   			
		   			end
		   			string.sort!
		   		end
			end
		end

puts string
sum? sum
