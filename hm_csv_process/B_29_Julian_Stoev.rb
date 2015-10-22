require 'csv'

csvf = CSV.read(ARGV[0])
command = ARGV[1].to_s
option1 = ARGV[2].to_i
option2 = ARGV[3]

def fwrite csv
	CSV.open("result.csv", "w") do |csv1|
		csv.each {|element| csv1 << element}
	end	
end

def sort option1, option2, csv
	csv.sort! do |a, b|
		if option2 == 'ASC'
			a[option1] <=> b[option1]
    		elsif option2 == 'DESC'
      			b[option1] <=> a[option1]
    		end
	end
	fwrite csv
end

def filter_cost min_value, max_value, csv
	csv.select! { |a| min_value <= a[2].to_i && a[2].to_i <= max_value }
	sort 2, 'ASC', csv
end

if command == 'sort'
	sort option1, option2.to_s, csvf
elsif command == 'filter_cost'
	filter_cost  option1, option2.to_i, csvf
else puts "You are not my friend, you are my brother, my friend"
end


