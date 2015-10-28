require 'csv'



CSV.open("result.csv","w") do |csv_array|
  Dir.glob(ARGV[0] + "*").each do |files|
	name = files.split("/").last.split("_")
	name = files.split(".").first
		
	if name.size == 3 && name[1].count == 5
		first_name = name[0]
		last_name = name[1]
		csv_array << [first_name, last_name]
	end
  end	
end
my_csv = CSV.read 'result.csv'
my_csv.sort_by! {|a| a[1].downcase}
CSV.open("result.csv", "w") do |csv|
  my_csv.each {|element| csv << element}
end
     
