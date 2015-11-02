require 'csv'
inputFile = ARGV[0]
myCsv = CSV.read inputFile, converters: :numeric
command = ARGV[1]
if command == 'sort'
columnNumber = ARGV[2].to_i
order = ARGV[3]
myCsv.sort! do |a, b|
if order == 'ASC'
a[columnNumber] <=> b[columnNumber]
elsif order == 'DESC'
b[columnNumber] <=> a[columnNumber]
end
end
CSV.open('result.csv', 'w') do |csv|
myCsv.each { |line| csv << line }
end
elsif command == 'filter_cost'
min_value = ARGV[2].to_i
max_value = ARGV[3].to_i
CSV.open('result.csv', 'w') do |csv|
myCsv.each do |line|
csv << line if line[2] >= min_value && line[2] <= max_value
end
end
end
