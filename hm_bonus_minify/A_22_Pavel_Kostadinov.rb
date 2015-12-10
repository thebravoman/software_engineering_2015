require 'csv'
def printing(csv_file, date)
 csv_file.each do |line|
   if line[0] == date
     puts line.join(',')
   end
 end
end
def printing_with_value(csv_file, date, value)
  csv_file.each do |line|
    if line[0] == date && line[3].to_i.between?((value - 10), (value + 10))
      puts line.join(',')
    end
  end
end

file = CSV.read ARGV[0]
date = ARGV[1]
value = ARGV[2].to_i

if ARGV[2]
  printing_with_value(file, date, value)
else 
  printing(file, date) 
end
