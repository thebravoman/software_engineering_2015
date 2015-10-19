require 'csv'

csv_file = ARGV[0]
command = ARGV[1]
column_number = ARGV[2]
order = ARGV[3]
the_csv = CSV.read csv_file

def write_result the_csv
 CSV.open("result.csv", "w") do |csv|
  the_csv.each do
   |cage| csv << cage
  end
 end
end

def sorting the_csv,column_number
 if column_number == "1"
    the_csv.sort! { |a,b| [a[0].to_s] <=> [b[0].to_s] }
 elsif column_number == "2"
    the_csv.sort! { |a,b| a[1] <=> b[1] }
 elsif column_number == "3"
    the_csv.sort! { |a,b| [a[2].to_i] <=> [b[2].to_i] }
 end
 write_result the_csv
end

if command == "sort" && order == "ASC"
  sorting the_csv, column_number
elsif command == "sort" && order == "DESC"
  sorting the_csv, column_number
  the_csv = the_csv.reverse
  write_result the_csv
elsif command == "filter_costs"
  the_csv = the_csv.sort_by {|row| row[2].to_i}
   CSV.open("result.csv", "w") do |csv|
    the_csv.each do |row|
     if (row[2].to_i >= column_number.to_i) && (row[2].to_i <= order.to_i)
       csv << row
     end
    end
   end
  the_csv = CSV.read csv_file
end
