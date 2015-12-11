require_relative 'A_21_Nikolay_Danailov/csv_searcher.rb'

def print_output output
  output.each do |row|
    puts row.join ','
  end
end

def number? str
  true if Float(string) rescue false
end

def date? str
  /\d{1,2}\/\d{1,2}\/\d*/.match str
end

arg1 = ARGV[0]
arg2 = ARGV[1]
arg3 = ARGV[2].to_f if ARGV.size > 2

if date? arg2
  CSVSearcher.print_date_output arg1, arg2, arg3
elsif !number?(arg2) && arg2 != 'xml'
  CSVSearcher.print_account_output arg1, arg2
else

end