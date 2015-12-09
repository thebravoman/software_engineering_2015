require 'csv'
file = ARGV[0].to_s
date = ARGV[1].to_s
mon_csv = CSV.read(file, headers:true)
mon_csv.each do |row|
	if row['date'] == date
		at_col = 0
		row.each do |key, val|
			at_col = at_col + 1
			print val
			if  !(at_col == row.size)
				print ","
			end
		end
		print "\n"
	end
end 