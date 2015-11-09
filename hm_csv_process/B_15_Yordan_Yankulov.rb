require 'csv'

csv_file = ARGV[0]
file = CSV.read csv_file
command = ARGV[1]


	if command == "sort"
		column = ARGV[2].to_i
		option = ARGV[3]

		if option == "ASC"
			file.sort! {|c,n| c[column] <=> n[column]}
		elsif option == "DESC"
			file.sort! {|c,n| n[column] <=> c[column]}
		end
	CSV.open("result.csv","w") do |csv|
		file.each {|element| csv << element}
  end
	elsif command == "filter_costs"
		min_value = ARGV[2].to_i
		max_value = ARGV[3].to_i
			CSV.open("result.csv","w") do |csv|
			file.each {|element|
							csv << element  if element[2].to_i <= max_value && element[2].to_i >= min_value}
		end
	end
