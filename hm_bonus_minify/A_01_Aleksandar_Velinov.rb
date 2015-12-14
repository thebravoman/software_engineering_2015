require_relative 'A_01_Aleksandar_Velinov/date_printer.rb'
require_relative 'A_01_Aleksandar_Velinov/account_printer.rb'
require 'csv'


file_csv = ARGV[0]
arg = ARGV[1]
arg2 = ARGV[2]

def date? str
  /\d{1,2}\/\d{1,2}\/\d*/.match str
end

def number? str
  true if Float(str) rescue false
end

file_csv=CSV.read(file)

if date? arg
	DatePrinter.print file, arg, arg2
else 
	AccountPrinter.print file, arg
end
