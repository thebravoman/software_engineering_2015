require 'csv'

def putsRow(csvRead, dateArg, valueArg)
	csvRead.each do |row|
		date = row[0]
		value = row[3].to_i
		#currency = row[4]

		if (date == dateArg) and ((valueArg-10 <= value) and (valueArg+10 >= value))
			puts row.join(" ")
		elsif ((valueArg == 0) or (valueArg == nil)) and (date == dateArg)
			puts row.join(" ")
		end
	end	
end


fileArg = ARGV[0]
csvRead = CSV.read(fileArg)
dateArg = ARGV[1]
valueArg = ARGV[2].to_i

putsRow(csvRead, dateArg, valueArg)
