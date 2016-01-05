require 'csv'
require 'rexml/document'

def is_date? date_wannabe
	/\d{1,2}\/\d{1,2}\/\d*/.match date_wannabe
end

def match_dates? line, date
	line[0] == date
end

def is_within_value? line, date, value
	(line[3].to_i > (value - 10)) && (line[3].to_i < (value + 10))
end

filename = ARGV[0]
first_argument = ARGV[1]
value = ARGV[2].to_i
output_info = []
sum = 0

my_csv = CSV.read filename

my_csv.each do |line|
	if is_date? first_argument 
		if value == 0
			if	(line[0] == first_argument)
				output_info << line.join(',')
			end
		elsif (is_within_value? line, first_argument, value) && (match_dates? line, first_argument)
			output_info << line.join(',')
		end
	else
		if line[1] == first_argument 
			output_info << line.join(',')
			sum += line[3].to_f
		end
	end
end
 
output_info.sort! { |a,b| Date.parse(a.split(",").first) <=> Date.parse(b.split(",").first) }

output_info.each do |element|
	puts element
end
if sum != 0 
	puts sum.round 3
end 

my_xml = REXML::Document.new
minify = my_xml.add_element('minify')
accounts = Hash.new
dates = Hash.new
date = []
my_csv.each do |line|
	accounts[line[1]] = []
	dates[line[0]] = []
end
my_csv.each do |line|
	accounts[line[1]] << line[0]
	dates[line[0]] << line[3]
end

#p accounts
#p dates

#accounts = accounts.sort {|keys, values| keys[1] <=> keys[0]}
#account = accounts.sort_by {|keys, values| keys}.reverse	

accounts.each do |key,value|
	#p key 
	#p value = value.uniq

	account = minify.add_element(key.to_s)
	value.each do |arr|
		xml_dates = account.add_element(arr.to_s)
		#p dates
		#p arr
		xml_dates.add_element(dates[arr])
=begin
		 dates.each do |date, amount|
			amount_holder = xml_dates.add_element(amount)
			amount.each do |am| 
				amount_holder.add_element(amount)
			end 
		end
=end
	end
end
printer = REXML::Formatters::Pretty.new(4) 
printer.compact = true 
printer.write(my_xml, $stdout)
