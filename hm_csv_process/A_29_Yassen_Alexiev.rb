require 'csv'
file_input = ARGV[0]
csv_varible = CSV.read file_input
choice_command = ARGV[1]
choice_sort_column = ARGV[2].to_i
sort_ASC_or_DESC = ARGV[3]
if choice_command == "sort"
	if sort_ASC_or_DESC == "ASC"
		csv_varible = csv_varible.sort_by do |product|
			if choice_sort_column == 0
				product[choice_sort_column].to_i
			else
				product[choice_sort_column].downcase
			end
		end
		csv_varible = csv_varible.sort_by do |product|
			if choice_sort_column == 1
				product[choice_sort_column].to_i
			else
				product[choice_sort_column].downcase
			end
		end
		csv_varible = csv_varible.sort_by do |product|
			if choice_sort_column == 2
				product[choice_sort_column].to_i
			else
				product[choice_sort_column].downcase
			end
		end
	elsif sort_ASC_or_DESC == "DESC"
		csv_varible = csv_varible.sort_by do |product|
			if choice_sort_column == 0
				product[choice_sort_column].to_i
			else
				product[choice_sort_column].downcase
			end
		end
		csv_varible.sort.reverse!

		csv_varible = csv_varible.sort_by do |product|
			if choice_sort_column == 1
				product[choice_sort_column].to_i
			else
				product[choice_sort_column].downcase
			end
		end
		csv_varible.sort.reverse!

		csv_varible = csv_varible.sort_by do |product|
			if choice_sort_column == 2
				product[choice_sort_column].to_i
			else
				product[choice_sort_column].downcase
			end
		end
		csv_varible.sort.reverse!
	end
elsif choice_command == "filter_costs"
	minimum_cost = ARGV[2].to_i
	maximum_cost = ARGV[3].to_i
	csv_varible = csv_varible.select {|product| product[2].to_i >= minimum_cost and product[2].to_i <= maximum_cost}
	csv_varible = csv_varible.sort_by {|column| column[2].to_i}
end

CSV.open("result.csv", "w") do |column|
	csv_varible.each {|csv_product| column << csv_product}
end