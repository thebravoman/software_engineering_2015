

class Filter
	def self.by_date(monefy_csv, date, date_col)
		result = Array.new
		for i in 0..monefy_csv.length - 1
			if (monefy_csv[i][date_col]).to_s == date
				result << monefy_csv[i]
			end
		end
		result
	end

	def self.by_int(monefy_csv, value, value_col)
		result = Array.new
		value = value.to_i
		for i in 0..monefy_csv.length - 1
			if ((monefy_csv[i][value_col]).to_i).between?(value - 10, value + 10)
				result << monefy_csv[i]
			end
		end
		result
	end
	
	def self.by_string(monefy_csv, account_name, value_col)
		result = Array.new
		for i in 0..monefy_csv.length - 1
			if monefy_csv[i][value_col] == account_name
				result << monefy_csv[i]
			end
		end
		result
	end
	
end
