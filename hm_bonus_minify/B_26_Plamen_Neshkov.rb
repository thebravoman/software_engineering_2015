require 'csv'

module Cols
  DATE = 0
  ACCOUNT = 1
  CATEGORY = 2
  AMOUNT = 3
  CURRENCY = 4
  DESCRIPTION = 5
end

def read_csv(filepath)
  csv_contents = CSV.read(filepath)
  csv_contents.shift

  return csv_contents
end

def filter_csv(csv_array, &predicate)
  filtered_csv = []

  csv_array.each do |row|
    filtered_csv << row if predicate.call(row)
  end

  return filtered_csv
end

def print_csv(csv_array)
  csv_string = CSV.generate do |str|
    csv_array.each do |row|
      str << row
    end
  end

  puts csv_string
end

filepath = ARGV[0]
filter_date = ARGV[1]

csv_contents = read_csv(filepath)
filtered_csv = filter_csv(csv_contents) do |row|
                 row[Cols::DATE] == filter_date
               end
print_csv(filtered_csv)
