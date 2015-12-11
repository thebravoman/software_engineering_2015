require_relative 'A_23_Petko_Georgiev/read_csv.rb'

def date? str
  /\d{1,2}\/\d{1,2}\/\d*/.match str
end

def number? str
  true if Float(str) rescue false
end

filename = ARGV[0]
arg1 = ARGV[1]
arg2 = ARGV[2]

if date? arg1
	ReadCSV.print_date_input filename, arg1, arg2
elsif number? arg1
elsif arg1 == 'xml'
else
	ReadCSV.print_account_input filename, arg1
end