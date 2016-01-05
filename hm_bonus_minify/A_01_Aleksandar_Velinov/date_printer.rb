class DatePrinter
	def self.print csv, date, value
		minimum = value.to_f - 10
		maximum = value.to_f + 10
		
		csv.each do |row|
			amount = row[3].to_f
			if row[0] == date && (value == nil || ( amount > minimum && amount < maximum ))
				puts row.join(",")
			end
		end
	end
end
