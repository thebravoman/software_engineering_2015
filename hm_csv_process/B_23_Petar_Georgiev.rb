require 'csv'

file = ARGV[0]
command = ARGV[1]
if command == "sort"
	column_number = ARGV[2].to_i
	order = ARGV[3].to_s
elsif command == "filter_cost"
	min_value = ARGV[2].to_i
	max_value = ARGV[3].to_i
else 
	puts "Wrong Command Input"
end
csvfile = CSV.read file
		if command == "sort"
				csvfile.sort! do |a,b|
					if order == 'ASC'
						a[column_number] <=> b[column_number]
					elsif order == 'DESC'
						b[column_number] <=> a[column_number]
					else
						puts "Wrong Order"
					end
				end
				CSV.open('result.csv', 'w') do |csv|
			    csvfile.each { |line| csv << line }
				end
		elsif command == "filter_cost"
			CSV.open('result.csv', 'w') do |csv|
	    	csvfile.each do |line|
	    		if line[2].to_i >= min_value && line[2].to_i <= max_value
        		csv << line
      		end
      	end
    	end
		end 
