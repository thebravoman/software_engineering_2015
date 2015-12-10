require 'csv'
def printing(csv_file, date, value)
  csv_file.each do |line|
    if line[0] == date && line[3].to_i.between?((value - 10), (value + 10))
      puts line.join(',')
    end
  end
end

file = CSV.read ARGV[0]
date = ARGV[1]
value = ARGV[2].to_i


printing(file, date, value)
