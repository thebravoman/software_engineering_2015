require 'csv'

def checkDate_putsRow(csvRead, dateArg)
	csvRead.each do |row|
		row.each do |element|
			if element == dateArg 
				puts row.join(" ")
			end
		end
	end	
end


fileArg = ARGV[0]
csvRead = CSV.read(fileArg)
dateArg = ARGV[1]

checkDate_putsRow(csvRead, dateArg)
