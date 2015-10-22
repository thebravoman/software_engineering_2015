require 'csv'
file = ARGV[0]
command = ARGV[1]
my_csv = CSV.read file
	if command == 'sort' 
	column = ARGV[2].to_i
	order = ARGV[3].to_s
	
	my_csv.sort! do |a,b|
	if order == 'ASC'
	 a[column] <=> b[column]
	elsif order == 'DESC'
		b[column] <=> a[column]
	end
	end
	
	CSV.open("result.csv" , "w") do |csv|
		my_csv.each {|line| csv << line}
	end
	elsif command == 'filter_cost'
	minimum = ARGV[2].to_i
	maximum = ARGV[3].to_i
	CSV.open('result.csv', 'w') do |csv|
    my_csv.each do |line|
    if line[2].to_i >= minimum && line[2].to_i <= maximum
      csv << line 
    end
    end
    end
    end
