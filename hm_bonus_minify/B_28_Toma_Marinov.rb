require 'csv'
require 'date'

file_name = ARGV[0]
date = ARGV[1]
bool_value = ARGV[2] == nil

unless bool_value
	value = ARGV[2].to_i
end

begin
	Date.parse(date)
rescue ArgumentError
	bool_is_string = true
end

def sort_result(result)
	sorted_result = result.sort { |first, second| first[6..9][3..4][0..1] <=> second[6..9][3..4][0..1] }

	return sorted_result
end

def write_date_result(file_name, date, value, any_value)
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

def write_account_result(file_name, string)
	result = []
	overall_amount = 0.to_i

	File.readlines(file_name).each do |line|
		current_line = line.split(',')
		current_line_account = current_line[1]
		current_line_amount = current_line[3].to_i

		if current_line_account == string
			result << line
			overall_amount += current_line_amount
		end
	end

	result = sort_result(result)
	result << overall_amount

	return result
end

if bool_is_string
	puts write_account_result(file_name, date)
else
	puts write_date_result(file_name, date, value, bool_value)
end