require 'csv'
filename = ARGV[0]

date = ARGV[1]

DATE_ELEMENT = 0

CSV.open(filename, 'r') do |row|
  if row[DATE_ELEMENT] == date
    puts row.join(",").to_s
  end  
end
