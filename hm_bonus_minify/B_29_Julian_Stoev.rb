require 'rexml/document'

csv_file = ARGV[0]
argument1 = ARGV[1].to_s
value = ARGV[2]

def date_sort output
	output.sort_by!{|date| 
		array = date.split('/')
		month = array[0].to_i
		day = array[1].to_i
		year = array[2].to_i
	
		[year, month, day]
	}
end

def xml_output csv_data, csv_file
	account_nodes = Array.new 
	date_nodes = Array.new
	amount_nodes = Array.new
	output = Array.new

	xml_data = REXML::Document.new('')
	minify_node = xml_data.add_element('minify')
	csv_data.each do |row| 		
		row = row.split(',')
		if account_nodes.include?(row[1].to_s) == false
			account_nodes << row[1].to_s
		end
	end
	if account_nodes.first.downcase == 'account'
		account_nodes.delete(account_nodes.first)
	end
	account_nodes.sort!
	account_nodes.each do |account|
		csv_data = File.open(csv_file, 'r')
		account_node = minify_node.add_element('account')
		account_node.add_attribute('account_name', account)
		csv_data.each do |row|
			row = row.split(',')
			if row[1].to_s == account and 
			date_nodes.include?(row[0].to_s) == false
				date_nodes << row[0].to_s				
			end
		end
		date_nodes = date_sort(date_nodes)
		date_nodes.each do |date|
			csv_data = File.open(csv_file, 'r')
			date_node = account_node.add_element('date')
			date_node.add_attribute('date', date)
			csv_data.each do |row|
				row = row.split(',')
				if row[1] == account and 
				row[0] == date and 
				amount_nodes.include?(row[3]) == false
					amount_nodes << row[3]
				end
			end
			amount_nodes.sort!
			amount_nodes.each do |amount|
				amount_node = date_node.add_element('amount')
				amount_node.add_text(amount)
			end
			amount_nodes = Array.new
		end
		date_nodes = Array.new
	end
	form = REXML::Formatters::Pretty.new
 	form.compact = true
 	form.write(xml_data, $stdout)
 	puts
end

csv_data = File.open(csv_file, 'r')
output = Array.new
date_format = /\d{2}\/\d{2}\/\d{4}/
	
if value == nil and date_format.match(argument1) != nil
	csv_data.each do |row|
		row = row.split(',')
		if row.first.to_s == argument1 
			puts row.join(',')
		end
	end
elsif value != nil and date_format.match(argument1) != nil
	value = value.to_i
	csv_data.each do |row|
		row = row.split(',')
		if (row.first.to_s == argument1) and 
		(row[3].to_i.between?(value-10, value+10))
			puts row.join(',')
		end
	end
elsif value == nil and date_format.match(argument1) == nil and argument1 != "xml"
	sum = 0	
	csv_data.each do |row|
		row = row.split(',')
		if (row[1].to_s == argument1)
			sum = sum+row[3].to_i
			output << row.join(',')
		end
	end
	puts date_sort(output)
	puts sum
elsif value == nil and date_format.match(argument1) == nil and argument1 == "xml"
	xml_output(csv_data, csv_file)
end
