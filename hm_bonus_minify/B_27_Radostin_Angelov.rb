require 'csv'

def parse_csv path, input_date
	result = []
	data = CSV.read(path)
	data.shift
	data.each do |row|
		if row[0] == input_date
			result.push(row)
		end
	end
	
	return result
end

def print_result result
	result.each do |row_values|
		puts row_values.join(',')
	end
end

path = ARGV[0]
input_date = ARGV[1]
input_value = ARGV[2].to_f

result = parse_csv(path, input_date)
result.sort_by {|first, second| first[0] <=> second[0]}
print_result(result)