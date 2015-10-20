require 'csv'

input = ARGV[0]
my_csv = CSV.read input, converters: :numeric

command = ARGV[1]

def filter_file csv_file, min_cost,  max_cost
  csv_file.select {|item| item[2].to_i >= min_cost and item[2].to_i <= max_cost}
end

if command == 'sort'
  column_number = ARGV[2].to_i
  order = ARGV[3]

  my_csv.sort! do |a, b|
    if order == 'ASC'
      a[column_number] <=> b[column_number]
    elsif order == 'DESC'
      b[column_number] <=> a[column_number]
    end
  end

  CSV.open('result.csv', 'w') do |csv|
    my_csv.each { |line| csv << line }
  end
elsif command == 'filter_cost'
  min_cost = ARGV[2].to_i
  max_cost = ARGV[3].to_i
  my_csv = filter_file my_csv, min_cost, max_cost
  csv = my_csv.sort_by {|line| line[0].downcase}
  min_cost = ARGV[2].to_i
  max_cost = ARGV[3].to_i
  csv = filter_file csv, min_cost, max_cost
  csv = csv.sort_by {|line| line[2].to_i}
end

CSV.open('result.csv', "w") do |line|
  my_csv.each {|csv_item| line << csv_item}
end
