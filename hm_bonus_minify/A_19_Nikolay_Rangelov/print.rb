
class Print
	def self.print_csv(monefy_csv)
		for i in 0..monefy_csv.length-1
			for j in 0..monefy_csv[i].length-1
				print monefy_csv[i][j]
				if not j == monefy_csv[i].length-1
					print ","
				end
			end
			print "\n"
		end
	end

	def self.print_xml(string_xml)
		puts string_xml
	end
end
