require 'csv'
require 'date'

DATE_FORMAT = "%d/%m/%Y"

filename = ARGV[0]
date = Date.strptime(ARGV[1], DATE_FORMAT)
value = ARGV[2].to_i if ARGV[2] != nil

contents = []
CSV.foreach(filename) do |row|
  contents.push(row)
end

contents.shift
if value == nil
  matched = contents.select { |x| Date.strptime(x[0], DATE_FORMAT) == date }
else
  matched = contents.select { |x| Date.strptime(x[0], DATE_FORMAT) == date &&
                           x[3].to_i >= value - 10 && x[3].to_i <= value + 10 }
end

matched.sort! { |x, y| Date.strptime(x[0], DATE_FORMAT) <=> Date.strptime(
                                                      y[0], DATE_FORMAT) }
matched.each do |arr|
  puts "#{arr.join(",")}"
end
