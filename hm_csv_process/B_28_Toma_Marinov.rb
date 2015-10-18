require 'csv'

csv_input = ARGV[0]
command = ARGV[1].to_s
options = [ARGV[2].to_i, ARGV[3].to_s]

input_csv = File.open(csv_input, 'r')
csv_content = []
csv_content = CSV.read(input_csv)

def sort_col_order column, col_option, content
	case column
		when 0
			content.sort! { |a, b| a[column].to_s.downcase <=> b[column].to_s.downcase }
		when 1
			content.sort! { |a, b| Date.parse(a[1]) <=> Date.parse(b[1]) }
		else
			content.sort! { |a, b| a[column].to_i <=> b[column].to_i }
	end
	
	if col_option == 'DESC'
		content.reverse!
	end
end

def filter_cost min, max, content
	min = min.to_i
	max = max.to_i
	
	content.select! { |a| min <= a[2].to_i && a[2].to_i <= max }
	sort_col_order 2, 'ASC', content
end

def make_csv content
	CSV.open('result.csv', 'w') do |csv|
		content.each do |inf|
			csv << inf
		end
	end
end

if command == "sort"
	sort_col_order options[0], options[1], csv_content
elsif command == "filter_cost"
	filter_cost options[0], options[1], csv_content
else
	puts "#{command} is not a recognisable command!"
end

make_csv csv_content