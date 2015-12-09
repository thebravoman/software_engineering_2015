require 'csv'

def putsRow(csvRead, dateArg, valueArg)
	csvRead.each do |row|
		date = row[0]	
		value = row[3].to_i

		if (date == dateArg) and value.between?((valueArg-10),(valueArg+10))  
			puts row.join(" ")
		elsif (date == dateArg)
			puts row.join(" ")
		end
	end
end

fileArg = ARGV[0]
csvRead = CSV.read(fileArg)
dateArg = ARGV[1]
valueArg = ARGV[2].to_i

putsRow(csvRead, dateArg, valueArg)
