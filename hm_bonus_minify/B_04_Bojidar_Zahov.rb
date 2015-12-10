file  = ARGV[0]
date  = ARGV[1]
value = ARGV[2].to_i
require 'csv'

CSV.open('B_04_Bojidar_Zahov.csv', 'w') do |write|
     csv = CSV.read file
	csv.each do |row|
		if row[0] == date 
		     if row[3].to_i.between?(value-10, value+10)
			     puts row.join(",")
			          write << [row.join(",")]
			    
		     end
		end
	end
end
