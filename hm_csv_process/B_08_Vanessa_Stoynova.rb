require 'csv'

file = CSV.read(ARGV[0])
command = ARGV[1]

	if command == "sort"
		col = ARGV[2].to_i
		option = ARGV[3]
		if option == "ASC"
			file.sort! { |c,n| c[col] <=> n[col]}
		elsif option == "DESC"
			file.sort! {|c,n| n[col] <=> c[col]}
		end
	CSV.open('result.csv','w') do |csv|
		file.each {|element| csv << element}
	end
	elsif command == "filter_costs"
		min_value = ARGV[2].to_i
		max_value = ARGV[3].to_i
		file.sort! {|c,n| c[2].to_i <=> n[2].to_i}
			CSV.open('result.csv','w') do |csv|
			file.each do |element|
			if max_value >= element[2].to_i && min_value <= element[2].to_i
							csv << element
					end
			end
		end
	end
