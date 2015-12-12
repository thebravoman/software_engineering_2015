require 'csv'
require 'rexml/document'
 
 def convert_to_xml my_csv
	xml = REXML::Document.new
    minify = xml.add_element("minify")
	my_csv[1 .. -1] = my_csv[1 .. -1].sort_by! do |e|
	  d = e[0].split("/")
	  [e[1], d[2].to_i, d[1].to_i, d[0].to_i, e[3]]
	end
	checked_account = []
	checked_date = []
	account = ""
	date = ""
	my_csv[1 .. -1].each do |e|
	  if checked_account.include?(e[1].to_s)
	    if checked_date.include?(e[0].to_s)
	      amount = date.add_element("amount").add_text e[3].to_s
		else
		  date = account.add_element("date")
	      date.add_attribute("value", e[0])
	      amount = date.add_element("amount").add_text e[3].to_s 
		  checked_date << e[0].to_s
		end
	  else
		checked_date.clear
	    checked_account << e[1].to_s
		checked_date << e[0].to_s
		account = minify.add_element("account")
		account.add_attribute("value", e[1])
	    date = account.add_element("date")
	    date.add_attribute("value", e[0])
	    amount = date.add_element("amount").add_text e[3].to_s
	  end
	end
    formatter = REXML::Formatters::Pretty.new(4)
    formatter.compact = true
    formatter.write(xml, $stdout)
end

def date_value_print? line
	if ARGV[2]
		puts line.join(",") if ( (line[0] == $date) && (line[3].to_i.between?($value-10, $value+10)))
	else
		puts line.join(",") if line[0] == $date
	end
end

def account_sum line
	if(line[1] == $account)
		puts line.join(",")
		$sum_value+=line[3].to_f
	end 
end

def sort_by_date my_csv
  my_csv.sort_by! do |e|
    d = e[0].split("/")
    [d[2].to_i, d[1].to_i, d[0].to_i]
  end
end

filename = ARGV[0]
my_csv = CSV.read(filename)
$date = nil
$account = nil

if (!ARGV[1].include?("/")) && !(ARGV[1] =~ /\d/) && (ARGV[1] != "xml")
	$account = ARGV[1]
	$sum_value = 0
elsif (ARGV[1] == "xml")
	convert_to_xml my_csv
else
	$date = ARGV[1] 
end
$value = ARGV[2].to_i

if ARGV[1] != "xml"
  sort_by_date my_csv
  my_csv.each do |line|
	  if($date != nil) 
		  date_value_print? line
	  else
		  account_sum line if($account != nil)
	  end
  end
end

puts $sum_value.round.to_i if($account != nil)