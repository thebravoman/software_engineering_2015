money_data = ARGV[0]
date = ARGV[1].to_s
value = ARGV[2].to_i

csv_file = File.open(money_data, 'r')

csv_file.each do |row|
	row = row.split(',')
	if (row.first.to_s == date) and (row[3].to_i.between?(value-10, value+10))
		puts row.join(',')
	end
end
