money_data = ARGV[0]
date = ARGV[1].to_s

csv_file = File.open(money_data, 'r')

csv_file.each do |row|
	row = row.split(',')
	if row.first.to_s == date 
		puts row.join(',')
	end
end
