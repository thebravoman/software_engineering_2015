require 'csv'

OUTPUT_FILENAME = "result.csv"
SORT_COMMAND = "sort"
FILTER_COMMAND = "filter_costs"

def save_csv(purchases)
  CSV.open(OUTPUT_FILENAME, "w") do |csv|
    purchases.each do |entry|
      csv << entry
    end
  end
end

def sort_by_column(purchases, column_number, order)
  case column_number
  when 2
    purchases.sort! { |a, b| a[2].to_i <=> b[2].to_i }
  when 1
    purchases.sort! { |a, b| Date.parse(a[1]) <=> Date.parse(b[1]) }
  else
    purchases.sort! { |a, b| a[column_number] <=> b[column_number] }
  end

  if order.downcase == 'desc'
    purchases.reverse!
  end
end

def filter_cost(purchases, min_value, max_value)
  purchases.select! { |a| min_value <= a[2].to_i && a[2].to_i <= max_value }
  sort_by_column(purchases, 2, 'ASC')
end

input_filename = ARGV[0]
command = ARGV[1]
first_option = ARGV[2]
second_option = ARGV[3]

purchases = []

CSV.foreach(File.path(input_filename)) do |line|
  purchases << [line[0], line[1], line[2]]
end

if command.downcase == SORT_COMMAND
  sort_by_column(purchases, first_option.to_i, second_option)
elsif command.downcase == FILTER_COMMAND
  filter_cost(purchases, first_option.to_i, second_option.to_i)
end

save_csv(purchases)
