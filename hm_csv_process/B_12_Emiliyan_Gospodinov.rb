require 'csv'

csv_file = ARGV[0]
command = ARGV[1]
column_number = ARGV[2]
order = ARGV[3]
my_csv = CSV.read csv_file

def write_result my_csv
 CSV.open("result.csv", "w") do |csv|
  my_csv.each {|cell| csv << cell}
 end
end

def sorting my_csv,column_number
 if column_number == "1"
    my_csv.sort! { |a,b| [a[0].to_s] <=> [b[0].to_s] }
 elsif column_number == "2"
    my_csv.sort! { |a,b| a[1] <=> b[1] }
 elsif column_number == "3"
    my_csv.sort! { |a,b| [a[2].to_i] <=> [b[2].to_i] }
 end
 write_result my_csv
end

if command == "sort" && order == "ASC"
  sorting my_csv, column_number
elsif command == "sort" && order == "DESC"
  sorting my_csv, column_number
  my_csv = my_csv.reverse
  write_result my_csv
elsif command == "filter_costs"
  my_csv = my_csv.sort_by {|row| row[2].to_i}
   CSV.open("result.csv", "w") do |csv|
    my_csv.each do |row|
     if (row[2].to_i >= column_number.to_i) && (row[2].to_i <= order.to_i)
       csv << row
     end
    end
   end
  my_csv = CSV.read csv_file
end
