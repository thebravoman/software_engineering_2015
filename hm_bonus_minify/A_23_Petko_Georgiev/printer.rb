require 'csv'

class Printer
	private
	
	DATE_COLUMN = 0
	ACCOUNT_COLUMN = 1
	CATEGORY_COLUMN = 2
	AMOUNT_COLUMN = 3
	CURRENCY_COLUMN = 4
	DESCRIPTION_COLUMN = 5

	def self.ConvertDate date
		date_split = date.split('/');
		dd = date_split[0]
		mm = date_split[1]
		yyyy = date_split[2]
		"#{yyyy}/#{mm}/#{dd}"
	end

	def self.print_xml(xml)
		formatter = REXML::Formatters::Pretty.new
		formatter.write(xml, $stdout)
	end

	def self.print_csv(csv)
		csv.each do |row|
			puts row.join ','
		end
	end


end
