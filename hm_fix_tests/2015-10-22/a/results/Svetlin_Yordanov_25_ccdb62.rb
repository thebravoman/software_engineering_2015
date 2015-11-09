require 'csv'

dest = ARGV[0]

CSV.open("result.csv", "w") do |csv|
	Dir.glob(dest.to_s + "/*").each do |f_path|
	
		f_name = f_path.split("/").last.to_s
		st_first_name = f_name.split("_").first.to_s
		st_last_name = f_name.split("_")[1].to_s
		
		if st_last_name.size == 5
			csv << [st_first_name, st_last_name]
		end
	
	end
	
	my_csv = CSV.read("result.csv")
	my_csv.sort! { |a,b| a[0].downcase <=> b[0].downcase }.reverse
	
	CSV.open("result.csv", "w") do |csv|
		my_csv.each do |element|
			csv << element
		end
	end
	
end


