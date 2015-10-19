#!/usr/bin/env ruby
require 'csv'

my_csv = CSV.read ARGV[0]

def sort_column_asc csv, column
  if column == 0
    csv.sort! {|a, b| a[0]<=>b[0]}
  elsif column == 1
    csv.sort! {|a, b| a[1]<=>b[1]}
  elsif column == 2
    csv.sort! {|a, b| [a[2].to_i]<=>[b[2].to_i]}
  end
end

if ARGV[1] == "sort"
  if ARGV[3] == "ASC"
    column = ARGV[2].to_i
    my_csv = sort_column_asc my_csv, column
  elsif ARGV[3] == "DESC"
    column = ARGV[2].to_i
    my_csv = sort_column_asc my_csv, column
    my_csv.reverse!
  end
    
    CSV.open("result.csv", "w") do |csv|
      my_csv.each do |row|
      csv << row
      end
    end
elsif ARGV[1] == "filter_costs" || ARGV[1] == "filter_cost"
  min = ARGV[2].to_i
  max = ARGV[3].to_i
    
  CSV.open("result.csv", "w") do |csv|
    my_csv.each do |row|
      puts row[0]
      if row[2].to_i >= min && row[2].to_i <= max
        csv << row
      end
    end
  end
end

