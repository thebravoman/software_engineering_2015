require 'csv'

def sort_column in2,in3,arr_table
	
	if in2.to_i == 0 && in3 == 'ASC'
		arr_table.sort! {|a,b| [a[0].downcase]<=> [b[0].downcase]}
	elsif (in2.to_i == 1 || in2.to_i == 2) && in3 == 'ASC'
		arr_table.sort! {|a,b| a[in2.to_i] <=> b[in2.to_i]}
	end

	if in2.to_i == 0 && in3 == 'DESC'
		arr_table.sort! {|a,b| b[0].downcase <=> a[0].downcase}
	elsif (in2.to_i == 1 || in2.to_i == 2) && in3 == 'DESC'
		arr_table.sort! {|a,b| b[in2.to_i] <=> a[in2.to_i]}
	end

	write_csv arr_table

end#END of sort_column

def write_csv arrtable

	CSV.open("result.csv","w") do |csv_result|
		arrtable.each do |line|
			csv_result << line
		end
	end

end#END of write_csv

def filter_cost in2,in3,arr_table
	array_cost = []

	arr_table.each do |line|
		if line[2].to_i >= in2.to_i && line[2].to_i <= in3.to_i
			array_cost << line
		end
	end

	write_csv array_cost

end#END of filter_cost

input0 = ARGV[0]
input1 = ARGV[1]
input2 = ARGV[2]
input3 = ARGV[3]

table = []
table = CSV.read input0

if input1 == 'sort'
	sort_column input2,input3,table
elsif input1 == 'filter_cost'
	filter_cost input2,input3,table
end