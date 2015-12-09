require 'csv'
def printing(csv_file, date)
  csv_file.each do |line|
    if line[0] == date
      puts line.join(',')
    end
  end
end

file = CSV.read ARGV[0]
date = ARGV[1]


printing(file, date)
