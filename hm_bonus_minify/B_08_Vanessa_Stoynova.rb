require 'csv'

file_name = ARGV[0]
date = ARGV[1]
value = ARGV[2]

my_csv = CSV.read file_name

my_csv.each do |line|
	if line[0] == date.to_s && !value
    		puts line.join(",")
  	elsif line[0] == date && value.to_i - 10 <= line[3].to_i && value.to_i + 10 >= line[3].to_i
    		puts  line.join(",")
  	end
end
