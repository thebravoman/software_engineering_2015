require 'csv'

inputed_filepath = ARGV[0].to_s
inputed_date = ARGV[1].to_s

monefy_csv = CSV.read(inputed_filepath, headers:true)
monefy_csv.each do |row|
	if row['date'] == inputed_date
		on_column = 0
		row.each do |key, value|
			on_column = on_column + 1
			print value
			if not on_column == row.size
				print ","
			end
		end
		print "\n"
	end
end 
