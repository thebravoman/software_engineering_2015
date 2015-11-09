require 'csv'

file = ARGV[0]
command = ARGV[1]

def sort_csv arr, column, order
	arr.sort! do |row1,row2|
		row1,row2 = row2,row1 if order == "DESC"
		if column == 2
			row1[column].to_i <=> row2[column].to_i
		else
			row1[column] <=> row2[column]
		end
	end
end

def filter_costs arr, min, max
	arr.select! {|item| item[2].to_i >= min && item[2].to_i <= max}
	sort_csv arr, 2, "ASC"
end

csv_in = CSV.read file

if command == "sort"
	sort_csv(csv_in, ARGV[2].to_i, ARGV[3])
elsif command == "filter_costs"
	filter_costs(csv_in, ARGV[2].to_i, ARGV[3].to_i)
end	

CSV.open("result.csv","w") do |csv_out|
	csv_in.each do |row|
		csv_out << row
	end
end
