require 'csv'

file_name = CSV.read ARGV[0]
date_or_string = ARGV[1]
value = ARGV[2]

def valid_date? date_or_string
	/\d{1,2}\/\d{1,2}\/\d*/.match date_or_string
end

def is_number?(value)
  true if Float(value) rescue false
end

def print_and_sort_string (file_name, date_or_string) 
	amount_value = 0.0
	array = []
	file_name.each do |row|
		if row[1] == date_or_string
			amount_value += row[3].to_f
			array << row
		end
	end

	array.sort_by! do |row| 
      date = row[0].split '/' 
      [date[2].to_i, date[1].to_i, date[0].to_i]
    end
    array.each do |row|
    	puts row.join(",")
    end
	puts amount_value.round 2
end

if !valid_date?(date_or_string)
	print_and_sort_string(file_name,date_or_string)
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