require 'csv'
file_name = ARGV[0]
action = ARGV[1]
arg_1 = ARGV[2]
arg_2 = ARGV[3]

csv_file = CSV.read file_name

if action == "sort"

	if arg_1.to_i == 0
		csv_file.sort! { |a,b| [a[arg_1.to_i].to_s.downcase] <=> [b[arg_1.to_i].to_s.downcase] }
	end

	if arg_1.to_i == 1
		csv_file.sort! { |a,b| a[arg_1.to_i] <=> b[arg_1.to_i] }
	end

	if arg_1.to_i == 2
		csv_file.sort! { |a,b| a[arg_1.to_i].to_i <=> b[arg_1.to_i].to_i }
	end

	if arg_2.to_s == "DESC"
		csv_file.reverse!
	end
end

if action == "filter_cost"
	min_val = arg_1.to_i
	max_val = arg_2.to_i
	CSV.open("result.csv", "wb") do |csv|
		csv_file.each do |line|
			if line[2].to_i >= min_val and line[2].to_i <= max_val
				csv << line
			end
		end
	end
end

if not action == "filter_cost"
	CSV.open("result.csv", "w") do |csv|
    	csv_file.each {|data| csv << data}	
	end
end
