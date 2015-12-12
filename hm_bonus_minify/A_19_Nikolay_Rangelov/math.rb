
class MinifyMath
	def self.csv_sum_cols(csv_file, col)
		sum = 0
		for i in 0..csv_file.length - 1
			sum = sum + (csv_file[i][col]).to_i
		end
		sum
	end
end