output = []
input_path = ARGV[0]
input_date = ARGV[1]
input_value = ARGV[2].to_i

File.open(input_path, 'r').each do |row|
	data = row.split(',')
	if data[0] == input_date
		if data[3].to_i >=  (input_value.to_i - 10) && data[3].to_i <= (input_value.to_i + 10)
			output.push(row)
		end
	end	
end

output.sort!
puts output
