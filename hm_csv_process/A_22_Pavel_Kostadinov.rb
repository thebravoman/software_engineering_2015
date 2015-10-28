require 'csv'

file_csv = ARGV[0]
command = ARGV[1]


my_csv = CSV.read file_csv

def write_csv my_csv
    CSV.open("result.csv", "w") do |csv|
      my_csv.each {|cell| csv << cell}
    end
end
  

def sort_column_asc csv, column
  if column == 0
    csv.sort! {|a, b| a[0]<=>b[0]}
  elsif column == 1
    csv.sort! {|a, b| a[1]<=>b[1]}
  elsif column == 2
    csv.sort! {|a, b| a[2].to_i<=>b[2].to_i}
    
  end
end

if command == "sort" && ARGV[3] == "ASC"
  column = ARGV[2].to_i
  my_csv = sort_column_asc my_csv, column
  write_csv my_csv
 
elsif command == "sort" && ARGV[3] == "DESC"
  column = ARGV[2].to_i
  my_csv = sort_column_asc my_csv, column
  my_csv.reverse!
  write_csv my_csv
  
  
elsif command == "filter_costs" or command == "filter_cost"
  min = ARGV[2].to_i
  max = ARGV[3].to_i


  CSV.open("result.csv", "w") do |csv|
    my_csv.each do |a|
      csv << a if a[2].to_i >= min && a[2].to_i <= max
    end
  end
 end
    
  
 
