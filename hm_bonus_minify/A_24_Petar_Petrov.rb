require 'csv'

file = ARGV[0]
if file.split(".").last == "csv"	
	csv = CSV.read(ARGV[0])
	date_requested = ARGV[1]
	value = ARGV[2]
	csv.each do |row|
	  date = row[0]
	  account = row[1] 
	  category = row[2] 
	  amount = row[3] 
	  currency = row[4] 
	  description = row[5] 
		if row[0] == date_requested && row.size == 6 && value.nil?
			puts "#{date}, #{account}, #{category}, #{amount}, #{currency}, #{description}"
		elsif row[0] == date_requested && row.size == 6 && !value.nil? && (amount.to_f >= value.to_f-10 && amount.to_f <= value.to_f+10)
		  puts "#{date}, #{account}, #{category}, #{amount}, #{currency}, #{description}"
		end
	end
end
