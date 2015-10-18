require 'csv'

def sort_column in2,in3,arr_table
	sorted_array = []
	if in2.to_i == 0 && in3 == 'ASC'
		sorted_array = arr_table.sort {|a,b| [a[0].downcase] <=> [b[0].downcase]}
	elsif (in2.to_i == 1 || in2.to_i == 2) && in3 == 'ASC' 
		sorted_array = arr_table.sort {|a,b| a[in2.to_i].to_i <=> b[in2.to_i].to_i} 
	end
		
	if in2.to_i == 0 && in3 == 'DESC'
		sorted_array = arr_table.sort {|a,b| [b[in2.to_i].downcase] <=> [a[in2.to_i].downcase]}
	elsif (in2.to_i == 1 || in2.to_i == 2) && in3 == 'DESC' 
		sorted_array = arr_table.sort {|a,b| b[in2.to_i].to_i <=> a[in2.to_i].to_i} 
	end

	write_csv sorted_array
end#sort_column END

def filter_cost in2,in3,arr_table
	cost_array = []
	
	arr_table.each do |line|
		cost_array << line if line[2].to_i >= in2.to_i && line[2].to_i <= in3.to_i
	end
	cost_array.sort!{|a,b| a[2].to_i <=> b[2].to_i}
	write_csv cost_array
end#sort_column END

def write_csv arrtable
	CSV.open("result.csv","w") do |csv_array|
		arrtable.each do |line|
			csv_array << line
		end
	end
end

input0 = ARGV[0]
input1 = ARGV[1]
input2 = ARGV[2]
input3 = ARGV[3]

table = CSV.open input0

if input1 == 'sort'
	sort_column input2,input3,table
elsif input1 == 'filter_cost'
	filter_cost input2,input3,table
end