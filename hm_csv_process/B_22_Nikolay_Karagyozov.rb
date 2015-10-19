require "csv"

def sort!(input, column, order)
  return if !["asc", "desc"].include?(order.downcase)
  input.sort_by! { |row| column == 2 ? row[column].to_f : row[column] }
  input.reverse! if order == "desc"
end

def filter_cost!(input, min_value, max_value)
  input.select! { |row| row[2].to_f >= min_value && row[2].to_f <= max_value }
end

input_csv = ARGV[0]
command = ARGV[1].downcase
first_option = ARGV[2].downcase
second_option = ARGV[3].downcase
rows = CSV.read(input_csv)

case command
when "sort"
  sort!(rows, first_option.to_i, second_option)
when "filter_cost"
  filter_cost!(rows, first_option.to_f, second_option.to_f)
  sort!(rows, 2, "ASC")
end

CSV.open("result.csv", "w") do |csv|
  rows.each { |row| csv << row[0..2] }
end
