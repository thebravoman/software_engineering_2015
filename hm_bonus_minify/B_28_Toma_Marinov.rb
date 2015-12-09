require 'csv'

file_name = ARGV[0]
date = ARGV[1]
value = ARGV[2].to_i

def write_result_to_array(file_name, date, value)
	result = []

	File.readlines(file_name).each do |line|
		current_line = line.split(',')
		current_line_date = current_line.first()
		current_line_amount = current_line[3].to_i

		if(current_line_date == date and (current_line_amount > (value - 10) and current_line_amount < (value + 10)))
			result << line
		end
	end

	return result
end

puts write_result_to_array(file_name, date, value)