require_relative 'A_21_Nikolay_Danailov/csv_searcher.rb'

filename = ARGV[0]
date = ARGV[1]
value = ARGV[2].to_f if ARGV.size > 2

output = CSVSearcher.get_date_output filename, date, value

output.each do |row|
  puts row.join ','
end