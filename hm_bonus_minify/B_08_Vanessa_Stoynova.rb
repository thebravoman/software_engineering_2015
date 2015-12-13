require 'csv'
require 'rexml/document'

sum = 0

file_name = ARGV[0]
account = ARGV[1].to_s
array = []


def to_xml my_csv

	my_csv = my_csv.sort_by { |a| [a[1].to_s.downcase , a[0].split("/")[2].to_i, a[0].split("/")[1].to_i, a[0].split("/")[0].to_i, a[3].to_f]}

  	document = REXML::Document.new('')
	  
  	node = document.add_element('minify')

  	my_csv.each do |line|
  	
    		#puts line[0].gsub("/",'')
    		acc = node.add_element('account')
    		date = acc.add_element('date')
    		amount = date.add_element('amount').text = "#{line[3]}"
		acc.add_attribute('', "#{line[1]}")
    		date.add_attribute('', "#{line[0]}")
    		
  	end

  	formatter = REXML::Formatters::Pretty.new
  	formatter.compact = true
  	formatter.write(document, $stdout)
  	p 
end

def print_and_sort_array array

	array.sort_by! do |date|
		time = date[0].split("/") 
		[time[2].to_i, time[1].to_i, time[0].to_i];
	end
	
	array.each do |line|
		puts line.join(",")
	end
end

my_csv = CSV.read file_name

my_csv.each do |line|

	if account == "xml" 
		puts to_xml(my_csv)	
		break
	end
	
	if ARGV[2] == nil
		account = ARGV[1].to_s
			 
		if line[1] == account
    			sum += line[3].to_i
    			array.push(line)
  		end
  		
  	elsif ARGV[2] != nil
  		date = ARGV[1]
  		value = ARGV[2]
  		
  		if line[0] == date && !value
  			array.push(line)
  		 else if line[0] == date && (value.to_i - 10 <= line[3].to_i && value.to_i + 10 >= line[3].to_i)
  			array.push(line)
  		 end
  		end 
  	end
end

print_and_sort_array array

if ARGV[2] == nil && ARGV[1] != "xml"
	puts "The amount value for all the output rows is: #{sum}\n"
end
