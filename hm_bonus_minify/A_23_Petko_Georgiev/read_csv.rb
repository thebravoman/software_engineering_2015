require 'csv'

class ReadCSV
	private
	
	DATE_FIELD = 0
	ACCOUNT_FIELD = 1
	AMOUNT_FIELD = 3
	
	def self.ConvertDate date
		date_split = date.split('/');
		dd = date_split[0]
		mm = date_split[1]
		yyyy = date_split[2]
		"#{yyyy}/#{mm}/#{dd}"
	end

	public

	def self.print_date_input filename, requested_date, value
		min_value = value.to_f - 10
		max_value = value.to_f + 10
		CSV.foreach(filename) do |row|
			amount = row[3].to_f
			if row[0] == requested_date && (value==nil||( amount>min_value && amount<max_value ))
				puts "#{row.join(',')}"
			end
		end
	end

	def self.print_account_input filename, requested_account
		output = []
		amount_sum = 0;
		CSV.foreach(filename) do |row|
			account = row[ACCOUNT_FIELD]
			if account == requested_account
				output << row
				amount_sum += row[AMOUNT_FIELD].to_f
			end
		end
		
		output.sort_by! { |row| ConvertDate(row[DATE_FIELD]) }
		output.each do |row|
			puts "#{row.join(',')}"
		end
		puts "#{amount_sum.round 2}"
	end
end