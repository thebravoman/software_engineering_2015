#!/usr/bin/ruby

require 'csv'

path = ARGV[0]
command = ARGV[1]
column_min = ARGV[2]
opt_max = ARGV[3]
my_csv = CSV.read path

def write_result my_csv
  CSV.open("result.csv", "w") do |csv|
    my_csv.each {|cell| csv << cell}
  end
end

def sort_asc_order my_csv,column_min

  if column_min == "1"
	my_csv.sort! { |a,b| [a[0].to_s] <=> [b[0].to_s] }

  elsif column_min == "2"
    my_csv.sort! { |a,b| a[1] <=> b[1] }

  elsif column_min == "3"
	my_csv.sort! { |a,b| [a[2].to_i] <=> [b[2].to_i] }

  end  

  write_result my_csv

end

if command == "sort" && opt_max == "ASC"
  sort_asc_order my_csv, column_min

elsif command == "sort" && opt_max == "DESC"
  sort_asc_order my_csv, column_min
  my_csv = my_csv.reverse
  write_result my_csv

elsif command == "filter_costs" || command == "filter_cost"
  my_csv = my_csv.sort_by {|row| row[2].to_i}
  CSV.open("result.csv", "w") do |csv|  
	my_csv.each do |row|
      if (row[2].to_i >= column_min.to_i) && (row[2].to_i <= opt_max.to_i)
        csv << row
      end
    end
  end
  my_csv = CSV.read path
end
