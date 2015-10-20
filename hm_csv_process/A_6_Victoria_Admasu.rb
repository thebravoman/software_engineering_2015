require 'csv'

file = ARGV[0]
csv_f = CSV.read file
command = ARGV[1]

def sort_f csv, column_number, order
	if order == 'ASC'
		if column_number != 2
			csv.sort! {|x, y| x[column_number] <=> y[column_number]}
		else 
			csv.sort! {|x, y| x[2].to_i <=> y[2].to_i}
		end
	elsif order == 'DESC'
		if column_number != 2
			csv.sort! {|x, y| y[column_number] <=> x[column_number]}
		else 
			csv.sort! {|x, y| y[2].to_i <=> x[2].to_i}
		end
	end
end

def filter_f csv, min_value, max_value
	CSV.open("result.csv", "w") { |csv|  
		csv.each { |x|
			if x[2].to_i >= min_value && x[2].to_i <= max_value
				csv << x
			end
		}
	}
end

if command == 'sort'
	column_number = ARGV[2].to_i
	order = ARGV[3]

	csv_f = sort_f csv_f, column_number, order

	CSV.open("result.csv", "w") { |csv|  
		csv_f.each { |line|
			csv << line
		}
	}
elsif command == 'filter_cost'
	min_value = ARGV[2].to_i
	max_value = ARGV[3].to_i

	csv_f = filter_f csv_f, min_value, max_value
end
