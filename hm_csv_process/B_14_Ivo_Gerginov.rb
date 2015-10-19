require 'csv'

def sort column, order

	
end



	
 

file = ARGV[0]
my_csv = CSV.read file
task = ARGV[1]

if task == 'sort'
	colnum = ARGV[2].to_i
	ord = ARGV[3].to_s
	my_csv.sort! do |a, b|
		if ord == 'ASC'
	    	a[colnum] <=> b[colnum]
	    	elsif ord == 'DESC'
	      	b[colnum] <=> a[colnum]
	    end
	end
	CSV.open('result.csv', 'w') do |csv|
		my_csv.each { |line| csv << line }
	end
elsif task == 'filter_cost'
	min = ARGV[2].to_i
	max = ARGV[3].to_i
	CSV.open('result.csv', 'w') do |csv|
	    my_csv.each do |line| 
	    if line[2] >= min && line[2] <= max
	    	csv << line
		end
	end
end
end