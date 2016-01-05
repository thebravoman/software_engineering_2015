require_relative 'A_21_Nikolay_Danailov/minify_date_printer.rb'
require_relative 'A_21_Nikolay_Danailov/minify_account_printer.rb'
require_relative 'A_21_Nikolay_Danailov/minify_xml_printer.rb'
require_relative 'A_21_Nikolay_Danailov/minify_best_months_printer.rb'
  
def is_url? str
  str_beginning = str.split(':').first
  str_beginning == 'http' || str_beginning == 'https'
end

def get_contents str
  if !is_url? str
    CSV.read(str)[1..-1]
  else
    url = URI.parse(str)
    http = Net::HTTP.new(url.host, url.port)

    if url.scheme == 'https'
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    contents = http.get(url.request_uri)
    text = Sanitize.clean(contents.body, remove_contents: ['script', 'style'])
    CSV.parse(text)[1..-1]
  end
end

def number? str
  /[0-9]+/.match str
end

def date? str
  /\d{1,2}\/\d{1,2}\/\d*/.match str
end

arg1 = ARGV[0]
arg2 = ARGV[1]
arg3 = ARGV[2].to_f if ARGV.size > 2

csv = get_contents arg1

if date? arg2
  MinifyDatePrinter.print_date_output csv, arg2, arg3
elsif number? arg2
  MinifyBestMonthsPrinter.print_best_months csv, arg2.to_i
elsif arg2 == 'xml'
  MinifyXMLPrinter.print_to_xml csv
else
  MinifyAccountPrinter.print_account_output csv, arg2
end