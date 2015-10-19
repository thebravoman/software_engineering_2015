require 'csv'

def sort column, order

	my_csv.sort! do |a, b|
		if order == 'ASC'
	    	a[colunm] <=> b[colunm]
	    	elsif ord == 'DESC'
	      	b[colunm] <=> a[colunm]
	    end
	end
	CSV.open('result.csv', 'w') do |csv|
		my_csv.each { |line| csv << line }
	end
end

def filter min, max

	CSV.open('result.csv', 'w') do |csv|
	    my_csv.each do |line| 
	    if line[2] >= min && line[2] <= max
	    	csv << line
		end
	end
end 

file = ARGV[0]
my_csv = CSV.read file
task = ARGV[1]

if task == 'sort'
	colnum = ARGV[2].to_i
	ord = ARGV[3].to_s
	sort colnum ord
elsif task == 'filter_cost'
	min = ARGV[2].to_i
	max = ARGV[3].to_i
	filter min max
end
end