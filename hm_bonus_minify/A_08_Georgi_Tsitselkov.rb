require 'csv'

filename = ARGV[0]
date = ARGV[1]
value = ARGV[2].to_i

if ARGV[2]
    CSV.read(filename).each do |row|
  	value_c = row[3].to_i	
  	if row[0] == date && (value_c-10) < value && value < (value_c+10)
	  	puts row.join(",")
		end
 	end

else
  CSV.open(filename, 'r').each do |row|
  if row[0] == date
    puts row.join(",").to_s
    end
  end
end
