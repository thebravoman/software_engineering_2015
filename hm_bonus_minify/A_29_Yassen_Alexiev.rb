require 'csv'
require 'rexml/document'

file_name = CSV.read ARGV[0]
date_or_string = ARGV[1]
value = ARGV[2]

def valid_date? date_or_string
	/\d{1,2}\/\d{1,2}\/\d*/.match date_or_string
end

def is_number?(value)
  true if Float(value) rescue false
end

def print_and_sort_string (file_name, date_or_string) 
	amount_value = 0.0
	array = []
	file_name.each do |row|
		if row[1] == date_or_string
			amount_value += row[3].to_f
			array << row
		end
	end

	array.sort_by! do |row| 
      date = row[0].split '/' 
      [date[2].to_i, date[1].to_i, date[0].to_i]
    end
    array.each do |row|
    	puts row.join(",")
    end
	puts amount_value.round 2
end

def xml_output_print file_name
	file_name.sort! {|k, m| [m[1].to_s, k[0].to_s, k[3].to_i] <=> [k[1].to_s, m[0].to_s, m[3].to_i] } 
    array = []
    xml = REXML::Document.new  
    minify = xml.add_element('minify')
    
    array = file_name[0][1]
    account = minify.add_element("account")
    account.add_attribute("", "#{array}")
    
    temp_date = file_name[0][0]
    
    file_name.each do |element|
    	if element[1] == array  
        	if element[0] != array
    			date = account.add_element("date")
        		date.add_attribute("", "#{element[0]}")
				
	       		amount = date.add_element("amount")
	        	amount.add_attribute("", "#{element[3]}")
	        else 
	        	array = element[0]
	       		amount = date.add_element("amount")
	        	amount.add_attribute("", "#{element[3]}")
        	end	
    	elsif element[1] != array
        	array = element[1]
        	account = minify.add_element("account")
        	account.add_attribute("", "#{element[1]}")
        	
        	date = account.add_element("date")
        	date.add_attribute("", "#{element[0]}")
        	
        	amount = date.add_element("amount")
        	amount.add_attribute("", "#{element[3]}")
    	end
    end
    out = ''
    xml.write(out, 2)
    puts out 
  end

if date_or_string == 'xml'
	xml_output_print(file_name)
else
	if !valid_date?(date_or_string)
		print_and_sort_string(file_name,date_or_string)
	else
		if is_number? value
			value = value.to_i
			file_name.each do |row|
				if row[0] == date_or_string && row[3].to_i >= (value-10) && row[3].to_i <= (value+10)
					puts row.join(",")
				end
			end
		else
			file_name.each do |row|
				if row[0] == date_or_string
					puts row.join(",")
				end
			end
		end
	end
end