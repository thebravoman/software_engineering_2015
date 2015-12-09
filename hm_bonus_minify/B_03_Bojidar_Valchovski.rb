require 'csv'

path = ARGV[0]
date = ARGV[1]

my_csv = CSV.read path

my_csv.each do |row|
  if row[0] == date
    puts row.join(',')
  end
end
