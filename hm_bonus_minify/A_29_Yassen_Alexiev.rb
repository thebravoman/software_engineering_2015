require 'csv'

file_name = CSV.read ARGV[0]
date_or_string = ARGV[1]
value = ARGV[2]
is_date_slash_count = date_or_string.count("/")
is_date_number_count = date_or_string.count(/[0-9_\s]/)

def is_number?(value)
  true if Float(value) rescue false
end

def valid_account? (date_or_string) 
	if !(is_date_slash_count == 2 && is_date_number_count == 8) 
	end
end

def print_and_sort_string (file_name,date_or_string) 
	amount_value = 0
	file_name = file_name.sort!
	file_name.each do |row|
		if row[1] == date_or_string
			amount_value += row[3]
			puts row.join(",")
		end
	end
	puts amount_value.to_i
end

if valid_account? date_or_string 
	print_and_sort_string (file_name,date_or_string)
else
	if is_number? value
		value = value.to_i
		file_name.each do |row|
			if row[0] == date_or_string && row[3].to_i >= (value-10) && row[3].to_i <= (value+10)
				puts row.join(",")
			end
		end
	else
		file_name.each do |row|
			if row[0] == date_or_string
				puts row.join(",")
			end
		end
	end
end