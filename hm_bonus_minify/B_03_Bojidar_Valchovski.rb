require 'date'
require 'csv'

path = ARGV[0]
option = ARGV[1]
value = ARGV[2].to_f

my_csv = CSV.read path
my_csv.sort!

my_csv.each do |row|
  if ARGV.length == 2
	begin
	  Date.parse(option)
	  if row[0] == option
        puts row.join(',')
      end
	rescue ArgumentError
	  if row[1] == option
        puts row.join(',')
      end
	end
  elsif ARGV.length == 3
      if (row[3].to_f > (value - 10)) && (row[3].to_f < (value + 10))
        puts row.join(',')
      end
  end
end
