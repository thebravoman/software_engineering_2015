#!/usr/bin/ruby
require 'csv'

csv_to_read = ARGV[0]
my_csv = CSV.read(csv_to_read)
command = ARGV[1].to_s
option_1 = ARGV[2].to_s
option_2 = ARGV[3].to_s


def sort_by_column_ASC(start_from)
	my_csv.sort! do |a, b|
	a[start_from] <=> b[start_from]
	end
end

def sort_by_column_DESC(start_from)
	my_csv.sort! do |a, b|
	b[start_from] <=> a[start_from]
	end
end

def filter_costs(i, j)
	if i > j
	max_value = i
	min_value = j
	else
	max_value = j
	min_value = i	
	end
	CSV.open('result.csv', 'w') do |csv|
		my_csv.each do |line|
		if line[2] >= min_value && line[2] <= max_value
		csv << line 
		end
		end
	end
end

if command == 'sort'
option_1.to_i
	if option_2 == 'ASC'
	sort_by_column_ASC(option_1)
	else
	sort_by_column_DESC(option_1)
	end
	CSV.open('result.csv', 'w') do |csv|
    my_csv.each { |line| 
	csv << line }
	end
	
end
if command == 'filter_costs' 
option_1.to_i
option_2.to_i
filter_costs(option_1, option_2)
end