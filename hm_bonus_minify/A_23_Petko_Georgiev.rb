require_relative 'A_23_Petko_Georgiev/date_printer.rb'
require_relative 'A_23_Petko_Georgiev/account_printer.rb'
require_relative 'A_23_Petko_Georgiev/xml_printer.rb'
require 'csv'
require 'uri'
require 'net/http'
require 'openssl'
require 'sanitize'

def url? str
	str =~ URI::regexp
end

def date? str
  /\d{1,2}\/\d{1,2}\/\d*/.match str
end

def number? str
  true if Float(str) rescue false
end

def get_input_data input
	if url? input
		url = URI.parse(input)
	    http = Net::HTTP.new(url.host, url.port)
	
	    if url.scheme == 'https'
	      http.use_ssl = true
	      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	    end
	
	    contents = http.get(url.request_uri)
	    text = Sanitize.clean(contents.body, remove_contents: ['script', 'style'])
	    CSV.parse(text)[1..-1]
	else
		CSV.read(input)[1..-1]
	end
end

input = ARGV[0]
arg1 = ARGV[1]
arg2 = ARGV[2]

csv = get_input_data input

if date? arg1
	DatePrinter.print csv, arg1, arg2
elsif number? arg1
elsif arg1 == 'xml'
	XMLPrinter.print csv
else
	AccountPrinter.print csv, arg1
end