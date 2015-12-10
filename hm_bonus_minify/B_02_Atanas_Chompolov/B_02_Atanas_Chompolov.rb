require 'csv'

def check(csvRead, accountArg)
	$sum = 0	
	result = []	

	csvRead.each do |row|
		#date = row[0]
		account = row[1]
		value = row[3].to_i
		#currency = row[4]	
		
		if (account == accountArg) 
			result.push(row)
			$sum += value
		end
	end
	
	return result
end

def putsRow(result)
	result.each do |row|
		puts row.join(" ")
	end
	puts "Total cash = #{$sum}"
end 

fileArg = ARGV[0]
csvRead = CSV.read(fileArg)
accountArg = ARGV[1]


result = check(csvRead, accountArg)
result.sort! { |a,b| [a[0],a[1].to_i] <=> [b[0],b[1].to_i] }

putsRow(result)
