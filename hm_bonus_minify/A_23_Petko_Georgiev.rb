require 'csv'

filename = ARGV[0]
requested_date = ARGV[1]
value = ARGV[2]
min_value = value.to_f-10
max_value = value.to_f+10

CSV.foreach(filename) do |row|
	amount = row[3].to_f
	if row[0] == requested_date && (value==nil||( amount>min_value && amount<max_value ))
		puts "#{row.join(', ')}"
	end
end
