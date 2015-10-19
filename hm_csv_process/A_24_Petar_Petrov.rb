require 'csv'

def sort? command
  command == "sort"
end

def asc? option_2
  option_2 == "ASC"
end

def column_contains_num? option_1
  option_1 == "2"
end

def desc? option_2
  option_2 == "DESC"
end

def filter_costs? command
  command == "filter_costs"
end

csv_file = ARGV[0]
command = ARGV[1]
option_1 = ARGV[2]
option_2 = ARGV[3]

my_csv = CSV.read csv_file
if sort? command
  column_number = option_1.to_i
  if asc? option_2
    my_csv.sort! { |a,b| if column_contains_num? option_1 
                           a[column_number].to_i <=> b[column_number].to_i 
                         else a[column_number].downcase <=> b[column_number].downcase 
                         end}
  elsif desc? option_2
    my_csv.sort! { |a,b| if column_contains_num? option_1  
                           b[column_number].to_i <=> a[column_number].to_i 
                         else b[column_number].downcase <=> a[column_number].downcase 
                         end}
  end
elsif filter_costs? command
  if option_1.to_i < option_2.to_i
    my_csv.sort_by! { |item_cost| item_cost[2].to_i}
    my_csv.delete_if { |a| a[2].to_i < option_1.to_i || a[2].to_i > option_2.to_i}
  else
    print "The first option is min_value the second - max_value!"
  end
end

CSV.open("result.csv","w") do |csv_row|
  my_csv.each do |my_row|
    csv_row << my_row
  end
end

