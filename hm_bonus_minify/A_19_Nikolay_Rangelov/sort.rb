class Sort
	def self.csv_sort_by_col(monefy_csv, col)
		monefy_csv.sort!{ |a,b| a[col] <=> b[col] }
		monefy_csv
	end
end