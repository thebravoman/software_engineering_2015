require 'csv'

def sort_ASC column, my_csv, csvpath
	case column
		when 0
		my_csv.sort! { |a,b| a[0].to_s <=> b[0].to_s }
		CSV.open(csvpath, "w") do |csv|
		my_csv.each {|element| csv << element}
		end
		
		when 1
		my_csv.sort! { |a,b| a[1] <=> b[1] }
		CSV.open(csvpath, "w") do |csv|
		my_csv.each {|element| csv << element}
		end
		
		when 2
		my_csv.sort! { |a,b| a[2].to_i <=> b[2].to_i }
		CSV.open(csvpath, "w") do |csv|
		my_csv.each {|element| csv << element}
		end
		
		else
		puts "This number for column is invalid"
		end
	end
	def sort_DESC csvpath
		sdesk = CSV.read csvpath
		sdesk = sdesk.reverse
		CSV.open(csvpath, "w") do |csv|
		sdesk.each {|element| csv << element}
	end
end
	csvpath = ARGV[0]
	my_csv = CSV.read csvpath
	command = ARGV[1]

		if command == "sort"
			column = ARGV[2].to_i
			option = ARGV[3]
		if option == "ASC"
			sort_ASC column, my_csv, csvpath
		elsif option == "DESC"
			sort_ASC column, my_csv, csvpath
			sort_DESC csvpath
		end
		elsif command == "filter_costs"
			min_value = ARGV[2].to_i
			max_value = ARGV[3].to_i
			sort_ASC 2, my_csv, csvpath
			filter = CSV.read csvpath
			CSV.open(csvpath, "a") do |searchresult|
			filter.each do |item|
		if item[0].split(",").last.to_i >= min_value and item[0].split(",").last.to_i <= max_value
		searchresult << filter[i]
		end
	end
end
	else
	puts "This command - '#{ARGV[0]}' does not exist"
end
