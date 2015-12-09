require 'csv'

DATE_COLUMN = 0

filename = ARGV[0]
date = ARGV[1]

output = []
CSV.foreach(filename) { |row| output << row if row[DATE_COLUMN] == date }
p output.to_a