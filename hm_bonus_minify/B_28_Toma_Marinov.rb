require 'csv'

file_name = ARGV[0]
date = ARGV[1]
bool_value = ARGV[2] == nil

unless bool_value
	value = ARGV[2].to_i
end

def write_result_to_array(file_name, date, value, any_value)
	result = []

	File.readlines(file_name).each do |line|
		current_line = line.split(',')
		current_line_date = current_line.first()
		current_line_amount = current_line[3].to_i

		if any_value
			if current_line_date == date
				result << line
			end
		else
			if(current_line_date == date and (current_line_amount > (value - 10) and current_line_amount < (value + 10)))
				result << line
			end
		end
	end

	return result
end

puts write_result_to_array(file_name, date, value, bool_value)