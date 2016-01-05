class AccountPrinter
	def self.print csv, requested_account
		output = Array.new
		sum = 0
		csv.each do |row|
			if row[1] == requested_account
				output << row
				sum += row[3].to_f
			end
		end
		output.sort_by! {|row| split_date = row.split('/') [ split_row[2].to_i, split_row[1].to_i, split_row[0].to_i ] }
		puts "#{ output.join(',') }"
		puts "#{sum.round 2}"
	end
end
