require 'csv'

input_file = ARGV[0]

CSV.open("result.csv", "w") do |csv|
	Dir.glob(ARGV[0]+"*").each do |file_name|
		names = file_name.split("/").last.split("_")
	
		if names.size == 3 and names[1].split(".").first.size == 10
			csv << names
		end
		
	end
end
  
	my_csv = CSV.read 'result.csv'
	my_csv.sort! { |a,b| a[1].to_s <=> b[1].to_s }
	CSV.open("result.csv", "w") do |csv|
	  my_csv.each {|element| csv << element}
	end


