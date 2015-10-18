require 'csv'

input_file = File.open(ARGV[0], "r")
command = ARGV[1]

content = []

def sort_column col, op, table
	if col == 0 
		table.sort! {|a, b| a[col].to_s.downcase <=> b[col].to_s.downcase}
	else 
		table.sort! {|a, b| a[col].to_i <=> b[col].to_i}
	end
	if op == "DESC" 
		table.reverse!
	end
	csv_maker table
end

def filter_cost min, max, table
	col = 2 
	option = "ASC"
	remember = []
	table.each do |row|
		if row[col].to_i >= min and row[col].to_i <= max
			remember << row
		end	
	end
	sort_column col, option, remember 
end

def csv_maker improved_table
	CSV.open("result.csv", "w") do |csv|
		improved_table.each { |element| 
			csv << element
		}
	end
end

content = CSV.read(input_file)

case command
when "sort"
	column = ARGV[2].to_i
	option = ARGV[3].to_s
	sort_column column, option, content
when "filter_cost"
	min_value = ARGV[2].to_i
	max_value = ARGV[3].to_i
	filter_cost min_value, max_value, content
else
	puts ""
end
