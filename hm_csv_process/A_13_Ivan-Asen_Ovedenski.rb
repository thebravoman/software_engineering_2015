require 'csv'

def sort p_2 , p_3, arr
		if p_2.to_i == 0
			if p_3 == 'ASC' 
				arr.sort! {|a,b| a[0].to_i <=> b[0].to_i}
				 #p "done sorting"
			elsif p_3 == 'DESC'
				arr.sort! {|a,b| b[0].to_i <=> a[0].to_i}
			else 
				p "Not a valid command"
			end
		elsif p_2.to_i == 1
			if p_3 == 'ASC' 
				arr.sort! {|a,b| [a[1].split('-')[0].to_i,a[1].split('-')[1].to_i,a[1].split('-')[2].to_i] <=> [b[1].split('-')[0].to_i,b[1].split('-')[1].to_i,b[1].split('-')[2].to_i] } 
			elsif p_3 == 'DESC'
				arr.sort! {|a,b| [b[1].split("-")[0].to_i,b[1].split("-")[1].to_i,b[1].split("-")[2].to_i] <=> [a[1].split("-")[0].to_i,a[1].split("-")[1].to_i,a[1].split("-")[2].to_i] } 
			else 
				p "Not a valid command"
			end
		elsif p_2.to_i == 2
			if p_3 == 'ASC' 
				arr.sort! {|a,b| a[2].to_i <=> b[2].to_i}
			elsif p_3 == 'DESC'
				arr.sort! {|a,b| b[2].to_i <=> a[2].to_i}
			else 
				p "Not a valid command"
			end
		else p "Not a valid column number"
		end	
		 CSV.open("result.csv","w") do |sorted_arr|
		arr.each do |parameter|
			sorted_arr << parameter
		end
	end
end

def filter_cost p_2, p_3 , arr 
p "done filtring"
	CSV.open("result.csv","w") do |csv_arr|
	arr.each do |cost|
		if cost[2].to_i >= p_2.to_i && cost[2].to_i <= p_3.to_i
			csv_arr << cost
		end
	end

end
end
filename = ARGV[0]
parameter_1 = ARGV[1] # sort or filter_cost
parameter_2 = ARGV[2] # coulmn_num or min_value
parameter_3 = ARGV[3] # ASC/DESC or max_value 

csv_arr = CSV.read filename

	if parameter_1 == 'sort'
	p "go sort"
		sort parameter_2, parameter_3, csv_arr
	elsif parameter_1 == 'filter_cost'
	p "go filter"
		filter_cost parameter_2, parameter_3, csv_arr
	else 
		p "#{parameter_1} is not a valid command"
	end



