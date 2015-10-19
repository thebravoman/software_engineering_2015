require 'csv'

def sort_by_itemname csvFile
	csvFile.sort! { |a,b| a[0] <=> b[0] }
end

def sort_by_date csvFile
	csvFile.sort! { |a,b| [a[1].split('-')[0].to_i,a[1].split('-')[1].to_i,a[1].split('-')[2].to_i]<=>[b[1].split('-')[0].to_i,b[1].split('-')[1].to_i,	b[1].split('-')[2].to_i] }
end

def sort_by_price csvFile
	csvFile.sort! { |a,b| a[2].to_i <=> b[2].to_i }
end


def choose_sorting csvFile, sort_column
	case sort_column
	when 0
		sort_by_itemname csvFile
	when 1
		sort_by_date csvFile
	when 2
		sort_by_price csvFile
	else
		puts "Wrong column number"
	end

	if(ARGV[3] == "DESC")
		csvFile.reverse!
	end	
end

def sort_csv csvFile, sort_column
	my_csv = CSV.read(csvFile)	
	choose_sorting my_csv,sort_column
	CSV.open("result.csv", "w") do |csv|
	  my_csv.each {|element| csv << element}
	end
end

def filter_costs csvFile
	min = ARGV[2].to_i
	max = ARGV[3].to_i
	my_csv = CSV.read(csvFile)
	CSV.open("result.csv", "w") do |csv|
	  my_csv.each do |element|	  	
	  	if element[2].to_i >= min && element[2].to_i <= max
	  		csv << element	  		
	  	end
	  end
	end

	sort_csv "result.csv", 2
end

def execute_command csvFile, command
	case command
	when "sort"
		sort_csv csvFile, ARGV[2].to_i
	when "filter_costs"
		filter_costs csvFile
	when "filter_cost"
		filter_costs csvFile
	else
		puts "Unknown command \"#{command}\""
	end
end

execute_command ARGV[0], ARGV[1]