require 'csv'

def date_filter(monefy_csv, date, date_col)
	result = Array.new
	for i in 0..monefy_csv.length - 1
		if (monefy_csv[i][date_col]).to_s == date
			result << monefy_csv[i]
		end
	end
	result
end

def value_filter(monefy_csv, value, value_col)
	result = Array.new
	value = value.to_i
	for i in 0..monefy_csv.length - 1
		if ((monefy_csv[i][value_col]).to_i).between?(value - 10, value + 10)
			result << monefy_csv[i]
		end
	end
	result
end

def print_csv(monefy_csv)
	for i in 0..monefy_csv.length-1
		for j in 0..monefy_csv[i].length-1
			print monefy_csv[i][j]
			if not j == monefy_csv[i].length-1
				print ","
			end
		end
		print "\n"
	end
end

in_filepath = ARGV[0]
in_date = ARGV[1]
in_value = ARGV[2]
DATE_COL = 0
VALUE_COL = 3


monefy_csv = CSV.read(in_filepath)
monefy_csv.shift

output = date_filter(monefy_csv, in_date, DATE_COL)
if not in_value == nil
	output = value_filter(output, in_value, VALUE_COL)
end

print_csv(output)