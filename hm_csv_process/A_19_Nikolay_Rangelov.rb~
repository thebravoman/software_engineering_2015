#!/usr/bin/ruby

require 'csv'

file_name = ARGV[0]
command = ARGV[1]
option_one = ARGV[2]
option_two = ARGV[3]

csv_file = CSV.read file_name

if command == "sort"
	column = option_one.to_i
	order = option_two.to_s

	if column == 0
		csv_file.sort! { |a,b| [a[column].to_s.downcase] <=> [b[column].to_s.downcase] }
	end

	if column == 1
		csv_file.sort! { |a,b| a[column] <=> b[column] }
	end

	if column == 2
		csv_file.sort! { |a,b| a[column].to_i <=> b[column].to_i }
	end

	if order == "DESC"
		csv_file.reverse!
	end
end


if command == "filter_cost"
	min_val = option_one.to_i
	max_val = option_two.to_i;
	CSV.open("result.csv", "wb") do |csv|
		csv_file.each do |line|
			if line[2].to_i >= min_val and line[2].to_i <= max_val
				csv << line
			end
		end
	end
end

if not command == "filter_cost"
	CSV.open("result.csv", "w") do |csv|
    	csv_file.each {|data| csv << data}	
	end
end