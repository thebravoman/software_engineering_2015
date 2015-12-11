require_relative 'A_19_Nikolay_Rangelov/filter.rb'
require_relative 'A_19_Nikolay_Rangelov/print.rb'
require_relative 'A_19_Nikolay_Rangelov/constants.rb'
require_relative 'A_19_Nikolay_Rangelov/sort.rb'
require_relative 'A_19_Nikolay_Rangelov/minify_math.rb'
require 'csv'
require 'date'


def date?(date_string)
	d, m, y = date_string.split '/'
	Date.valid_date? y.to_i, m.to_i, d.to_i
end

def number?(in_string)
  true if Float(in_string) rescue false
end

in_01 = ARGV[0] # filepath
in_02 = ARGV[1] # date / other 
in_03 = ARGV[2] # value

monefy_csv = CSV.read(in_01)
monefy_csv.shift

if !date?(in_02) && in_02 != "xml" && !number?(in_02)
	output = Filter.by_string(monefy_csv, in_02,COL::ACCOUNT)
	output = Sort.csv_sort_by_col(output,COL::DATE)
	Print.print_csv(output)	
	puts MinifyMath.csv_sum_cols(output, COL::AMOUNT)
else
	output = Filter.by_date(monefy_csv, in_02, COL::DATE)
	if not in_03 == nil
		output = Filter.by_int(output, in_03, COL::AMOUNT)
	end
	Print.print_csv(output)
end