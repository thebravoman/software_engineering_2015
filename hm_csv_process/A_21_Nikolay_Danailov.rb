require 'csv'

RESULT_FILE = "result.csv"
SORT_COMMAND = "sort"
FILTER_COMMAND = "filter_costs"

def sort_by_column csv_file, column
	csv_file.sort_by do |item|
		if column == 2 #because the costs should be treated as numbers
			item[column].to_i
		else
			item[column].downcase
		end
	end
end

def filter_file csv_file, min_cost,	 max_cost
	csv_file.select {|item| item[2].to_i >= min_cost and item[2].to_i <= max_cost}
end

input_file = ARGV[0]
command = ARGV[1]
csv = CSV.read input_file

if command == SORT_COMMAND
	sort_column = ARGV[2].to_i
	sort_order = ARGV[3]
	csv = sort_by_column csv, sort_column

	if sort_order == "DESC"
		csv = csv.reverse
	end
elsif command == FILTER_COMMAND
	min_cost = ARGV[2].to_i
	max_cost = ARGV[3].to_i
	csv = filter_file csv, min_cost, max_cost
	csv = csv.sort_by {|line| line[0].downcase}
  min_cost = ARGV[2].to_i
  max_cost = ARGV[3].to_i
  csv = filter_file csv, min_cost, max_cost
  csv = csv.sort_by {|line| line[2].to_i}
end

CSV.open(RESULT_FILE, "w") do |line|
	csv.each {|csv_item| line << csv_item}
end
