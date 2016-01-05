require 'csv'
require 'rexml/document'

string = []

file = ARGV[0]
account = ARGV[1].to_s
sum = 0

def to_xml my_csv
	my_csv = my_csv.sort_by do |a|
		 [a[1].to_s.downcase , a[0].split("/")[2].to_i, a[0].split("/")[1].to_i, a[0].split("/")[0].to_i, a[3].to_f]}
	end

  	document = REXML::Document.new('')  
  	node = document.add_element('minify')

  	my_csv.each do |row|
    		account2 = node.add_element('account')
    		date = account2.add_element('date')
    		amount = date.add_element('amount').text = "#{row[3]}"
			account2.add_attribute('', "#{row[1]}")
    		date.add_attribute('', "#{row[0]}")  		
  	end
  	formatter = REXML::Formatters::Pretty.new
  	formatter.compact = true
  	formatter.write(document, $stdout)
  	p 
end

def output_sort_string string
	string.sort_by! do |date|
		time = date[0].split("/") 
		[time[2].to_i, time[1].to_i, time[0].to_i];
	end
	
	string.each do |row|
		puts row.join(",")
	end
end

my_csv = CSV.read file
my_csv.each do |row|

	if account == "xml" 
		puts to_xml(my_csv)	
		break
	end
	
	if ARGV[2] == nil
		account = ARGV[1].to_s
			 
		if row[1] == account
    			sum += row[3].to_i
    			string.push(row)
  		end
  		
  	elsif ARGV[2] != nil
  		date = ARGV[1]
  		value = ARGV[2]
  		
  		if row[0] == date && !value
  			string.push(row)
  		 elsif row[0] == date && (value.to_i - 10 <= row[3].to_i && value.to_i + 10 >= line[3].to_i)
  			string.push(row)
  		 end
  		end 
  	end
end

output_sort_string string

if ARGV[2] == nil && ARGV[1] != "xml"
	puts "#{sum}\n"
end