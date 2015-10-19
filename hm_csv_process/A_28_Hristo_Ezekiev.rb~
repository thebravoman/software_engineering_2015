require 'csv'

path = ARGV[0]
my_csv = CSV.read path

RESULT = "result.csv"
SORT = "sort"
FILT = "filter_costs"

def column_sorting csv, column
	if column == 0
    		csv.sort! {|a, b| a[0]<=>b[0]}
  	elsif column == 1
    		csv.sort! {|a, b| a[1]<=>b[1]}
  	elsif column == 2
    		csv.sort! {|a, b| [a[2].to_i]<=>[b[2].to_i]}
  	end
end

if ARGV[1] == SORT
	if ARGV[3] == "ASC"
    		column = ARGV[2].to_i
    		my_csv = column_sorting csv, column
  	elsif ARGV[3] == "DESC"
    		column = ARGV[2].to_i
    		my_csv = column_sorting csv, column
    		my_csv.reverse!
  	end
    
    	CSV.open(RESULT, "w") do |csv|
      		my_csv.each do |row|
      		csv << row
      		end
    	end
elsif ARGV[1] == FILT || ARGV[1] == FILT
  	min = ARGV[2].to_i
  	max = ARGV[3].to_i
    
  	CSV.open(RESULT, "w") do |csv|
    		my_csv.each do |row|
			r = row[2].to_i
      			if r >= min && r <= max
      				csv << row
      			end
    		end
  	end
end


