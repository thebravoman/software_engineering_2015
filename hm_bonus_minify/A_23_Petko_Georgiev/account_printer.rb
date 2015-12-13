require_relative 'printer.rb'

class AccountPrinter < Printer
	public

	def self.print csv, requested_account
		output = []
		amount_sum = 0;
		csv.each do |row|
			account = row[ACCOUNT_COLUMN]
			if account == requested_account
				output << row
				amount_sum += row[AMOUNT_COLUMN].to_f
			end
		end
		
		output.sort_by! { |row| ConvertDate(row[DATE_COLUMN]) }
		output.each do |row|
			puts "#{row.join(',')}"
		end
		puts "#{amount_sum.round 2}" unless output.empty?
	end
end
