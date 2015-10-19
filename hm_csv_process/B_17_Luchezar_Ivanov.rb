require 'csv'

def result_csv csv_table
	CSV.open("result.csv", "w") do |csv|
		csv_table.each { |element| csv << element }
	end
end

def sort_table csv_table, col, opt
	if col == 0
		csv_table.sort! {|a,b| a[col].to_s.downcase <=> b[col].to_s.downcase}
	else
		csv_table.sort! {|a,b| a[col].to_i <=> b[col].to_i}
	end

	if opt.to_s.downcase == "desc"	
	csv_table.reverse 
	end
result_csv csv_table
end

def filter_table csv_table, min_cost, max_cost
	table = []
	col = 2 
	opt = "ASC"
	csv_table.each do |row|
		if row[col].to_i >= min_cost and row[col].to_i <= max_cost
			table << row
		end	
	end
	sort_table table, col, opt
end


command = ARGV[1]

csv_table = CSV.open(ARGV[0], "r")
csv_table = csv_table.to_a

case command
when "sort"
	col = ARGV[2].to_i
	opt = ARGV[3].to_s
	sort_table csv_table, col, opt
when "filter_cost"
	min_cost = ARGV[2].to_i
	max_cost = ARGV[3].to_i
	filter_table csv_table, min_cost, max_cost
else 
	puts "error: no such command '#{ARGV[1]}'"
end




