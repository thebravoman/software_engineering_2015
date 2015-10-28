require 'csv'
input = ARGV[0]
my_csv = CSV.read input
script_command = ARGV[1]
sort_colum = ARGV[2]
sort_ASC_DESC = ARGV[3]

def write_csv my_csv
  CSV.open("result.csv", "w") do |csv|
    my_csv.each {|element| csv << element}
  end
end

def filter_cost my_csv
  min_range = ARGV[2].to_i
  max_range = ARGV[3].to_i
  CSV.open("result.csv", "w") do |csv|
    my_csv.each do |element|          
	if element[2].to_i >= min_range && element[2].to_i <= max_range
	  csv << element                      
	end
    end
  end  
end

def sort_colum my_csv,column
  if column == "0"
    my_csv.sort! { |a,b| [a[0].to_s].map(&:downcase) <=> [b[0].to_s].map(&:downcase) }
  elsif column == "1"
    my_csv.sort! { |a,b| a[1] <=> b[1] }
  elsif column == "2"
    my_csv.sort! { |a,b| [a[2].to_i] <=> [b[2].to_i] }
  end
  write_csv my_csv
end

if script_command == "sort" && sort_ASC_DESC == "ASC"
  sort_colum my_csv, sort_colum
elsif script_command == "sort" && sort_ASC_DESC == "DESC"
  sort_colum my_csv, sort_colum
  my_csv = my_csv.reverse
  write_csv my_csv
elsif script_command == "filter_costs" || script_command == "filter_cost"
  filter_cost my_csv
end


