money_data = ARGV[0]
account = ARGV[1].to_s

output = Array.new
csv_file = File.open(money_data, 'r')
sum = 0

csv_file.each do |row|
	row = row.split(',')
	if (row[1].to_s == account)
		sum = sum+row[3].to_i
		output << row.join(',')
	end
end

puts output.sort!
puts sum
