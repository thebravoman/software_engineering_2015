require 'csv'

input_file_1 = ARGV[0]
input_file_2 = ARGV[1]
def equal? first_name, last_name, first_name_1, last_name_1
	first_name == first_name_1 && last_name == last_name_1
CSV.open("result.csv","w") do |csv_array|
	Dir.glob(ARGV[0] + "*").each do |files|
		name = files.split("/").last.split("_")
		name = files.split(".").first
		
		if name.size == 3 && files[0].count == 5
			first_name = files[0]
			last_name = files[1]
			csv_array << [first_name, last_name]
		end
	end
end

my_csv = CSV.read 'result.csv'
Dir.glob(ARGV[1] + "*").each do |files|
		name = files.split("/").last.split("_")
		name = files.split(".").first
		
		if name.size == 3 && files[0].count == 5
			first_name = files[0]
			last_name = files[1]
			CSV.open("result.csv", "w") do |csv|
				my_csv.each {|element| csv << element if csv.element[0] == first_name && csv.element[1] == last_name}
			end
			 my_csv.sort! { |a,b| a[1]] <=> b[1] }
		end
	end

			
