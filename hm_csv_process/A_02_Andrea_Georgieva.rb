require 'csv'

my_csv = CSV.read ARGV[0]

def sort_col_asc csv, col
  if col == 0
    csv.sort! {|a, b| a[0]<=>b[0]}
  elsif col == 1
    csv.sort! {|a, b| a[1]<=>b[1]}
  elsif col == 2
    csv.sort! {|a, b| [a[2].to_i]<=>[b[2].to_i]}
  end
end

if ARGV[1] == "sort"
  if ARGV[3] == "DESC"
    col = ARGV[2].to_i
    my_csv = sort_col_asc my_csv, col
    my_csv.reverse!
  elsif ARGV[3] == "ASC"
    col = ARGV[2].to_i
    my_csv = sort_col_asc my_csv, col
  end
    
    CSV.open("result.csv", "w") do |csv|
      my_csv.each do |line|
      csv << line
      end
    end
elsif ARGV[1] == "filter_cost" || ARGV[1] == "filter_costs"
  min = ARGV[2].to_i
  max = ARGV[3].to_i
    
  CSV.open("result.csv", "w") do |csv|
    my_csv.each do |line|
      if line[2].to_i >= min && line[2].to_i <= max
        csv << line
      end
    end
  end
end
