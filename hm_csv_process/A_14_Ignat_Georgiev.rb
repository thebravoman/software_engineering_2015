require 'csv'

my_file = CSV.read ARGV[0]
command = ARGV[1]
column = ARGV[2].to_i
type_sort = ARGV[3]
min = ARGV[2].to_i
max = ARGV[3].to_i
def sort_asc csv, column
  if column == 0
    csv.sort! {|a, b| [a[0].to_s]<=>[b[0].to_s]}
  elsif column == 1
    csv.sort! {|a, b| a[1]<=>b[1]}
  elsif column == 2
    csv.sort! {|a, b| [a[2].to_i]<=>[b[2].to_i]}
  end
end
if command == "sort"
   my_file = sort_asc my_file, column
  if ARGV[3] == "DESC"
    my_file.reverse!
  end
    
    CSV.open("result.csv", "w") do |csv|
      my_file.each do |line|
      csv << line
      end
end
if command == "filter_costs" || command == "filter_cost"    
  CSV.open("result.csv", "w") do |csv|
    my_file.each do |line|
      if line[2].to_i >= min && line[2].to_i <= max
        csv << line
      end
    end
  end
end
end
