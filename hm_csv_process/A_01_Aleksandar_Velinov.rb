require 'csv'

file_name = ARGV[0]
operation = ARGV[1]
first = ARGV[2]
second = ARGV[3]

csv_file = CSV.read file_name

if operation == "sort"
	if first.to_i == 0
		csv_file.sort! { |a,b| [a[first.to_i].to_s.downcase] <=> [b[first.to_i].to_s.downcase] }
	end
	if first.to_i == 1
		csv_file.sort! { |a,b| a[first.to_i] <=> b[first.to_i] }
	end
	if first.to_i == 2
		csv_file.sort! { |a,b| a[first.to_i].to_i <=> b[first.to_i].to_i }
	end

	if second.to_s == "DESC"
		csv_file.reverse!
	end
end

if operation == "filter_cost"
	CSV.open("result.csv", "wb") do |csv|
		csv_file.each do |line|
			if line[2].to_i >= first.to_i and line[2].to_i <= second.to_i
				csv << line
			end
		end
	end
end

if not operation == "filter_cost"
	CSV.open("result.csv", "w") do |csv|
    	csv_file.each {|data| csv << data}
	end
end
