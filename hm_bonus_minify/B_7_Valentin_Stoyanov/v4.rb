require 'rexml/document'

def v4
	def sort_csv
		@my_csv.sort! {|a, b| [b[1].to_s, a[0].to_s, a[3].to_i] <=> [a[1].to_s, b[0].to_s, b[3].to_i] }
	end
	
	def sortby_account
		@my_csv.sort_by! do |element|
			[element[1]]
		end
	end

	def to_xml  
		@my_csv.sort_by! { |a| [a[1].to_s.downcase , a[0].split("/").last , a[0].split("/")[1], a[0].split("/").first, a[3].to_f]}
		my_xml = REXML::Document.new('')
		minify = my_xml.add_element('minify')
		accounts = Hash.new(Hash.new(0))
		@my_csv.each do |line|
			l = line.split(',')
			if accounts.has_key?(l[1].to_s) and accounts.has_key?(l[0].to_s)
				if accounts.has_key?(l[1].to_s)
					account = accounts[l[1].to_s]
				else
					account = minify.add_element('account')
					account.add_attribute('account',l[1].to_s)
				end
				if accounts.has_key?(l[0].to_s)
					date = accounts[l[0].to_s]
				else 
					date = account.add_element('date')
					date.add_attribute('date', l.first.to_s)
				end
				amount = date.add_element('amount')
				amount.add_text(l[3].to_s)
			else
				account = minify.add_element('account')
				account.add_attribute('account',l[1].to_s)
				date = account.add_element('date')
				date.add_attribute('date', l.first.to_s)
				amount = date.add_element('amount')
				amount.add_text(l[3].to_s)
				accounts[l[0].to_s] = date
				accounts[l[1].to_s] = account
			end
		end
		my_xml
	end

	def xml_formatter xml
		formatter = REXML::Formatters::Pretty.new()
		formatter.compact = true
		formatter.write(xml, $stdout)
		puts ''
	end
	
	sortby_account 
	sort_csv
	converted = to_xml
	xml_formatter converted
end
