require 'csv'

filename = ARGV[0]

date = ARGV[1]

CSV.open(filename, 'r') do |row|
  if row[0] == date
    puts row.join(",").to_s
  end
end
