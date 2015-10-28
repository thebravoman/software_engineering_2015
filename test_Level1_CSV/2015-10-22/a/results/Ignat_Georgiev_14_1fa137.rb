require 'csv'
CSV.open("result.csv","w") do |csv|
	Dir.glob(ARGV[0]+"*").each do |filename|
		
		name = filename.split("/").last
		test= name.split("_")
		if test.size !=3
		length=name.size
		csv << [name,name.length ]
		end
	end	
end
CSV.open("result.csv","w") do |csv|
Dir.glob(ARGV[1]+"*").each do |filename|
		
		name = filename.split("/").last
		test= name.split("_")
		if test.size !=3
		length=name.size
		csv << [name,name.length ]
		end
	end	
end

my_csv = CSV.read 'result.csv'
my_csv.sort! { |a, b| b[1] <=> a[1] }
my_csv.uniq
my_csv.reverse!
CSV.open("result.csv","w") do |csv_array|
	my_csv.each do |row|
		csv_array << row
	end
end
