require 'csv'

input_file = ARGV[0]
my_csv = CSV.read input_file, converters: :numeric

command = ARGV[1]

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
  min_value = ARGV[2].to_i
  max_value = ARGV[3].to_i

  CSV.open('result.csv', 'w') do |csv|
    my_csv.each do |line|
      csv << line if line[2] >= min_value && line[2] <= max_value
    end
  end
end
