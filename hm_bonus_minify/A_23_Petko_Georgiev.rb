require_relative 'A_23_Petko_Georgiev/date_printer.rb'
require_relative 'A_23_Petko_Georgiev/account_printer.rb'
require_relative 'A_23_Petko_Georgiev/xml_printer.rb'

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
	DatePrinter.print filename, arg1, arg2
elsif number? arg1
elsif arg1 == 'xml'
	XMLPrinter.print filename
else
	AccountPrinter.print filename, arg1
end