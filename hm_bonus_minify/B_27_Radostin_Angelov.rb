require 'csv'

def parse_csv path, input_account
	result = []
	data = CSV.read(path)
	data.shift
	data.each do |row|
		if row[1] == input_account
			result.push(row)
		end
	end
	
	return result
end

def print_result result
	sum = 0
	result.each do |row_values|
		puts row_values.join(',')
		sum += row_values[3].to_i
	end
	
	puts sum
end

path = ARGV[0]
account = ARGV[1]

result = parse_csv(path, account)
date_format = '%d/%m/%Y'
result.sort! {|first, second| Date.strptime(first[0], date_format) <=> Date.strptime(second[0], date_format)}
print_result(result)