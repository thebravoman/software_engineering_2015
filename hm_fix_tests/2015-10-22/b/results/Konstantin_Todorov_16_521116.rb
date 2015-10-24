require 'csv'

path = ARGV[0]

Dir.glob("path").each do |file|
	result = file.split("_").first+1
	name_digits = result.split("")
	if name_digits == 5
		CSV.open("result.csv", "wb") do |csv|
			csv << file
		end			
	end
end
my_csv = CSV.read 'result.csv'

my_csv.sort! {|a ,b| a[0].to_i <=> b[0].to_i}.reverse!

CSV.open("result.csv", "wb") do |csv|
	csv << my_csv
end			


	

