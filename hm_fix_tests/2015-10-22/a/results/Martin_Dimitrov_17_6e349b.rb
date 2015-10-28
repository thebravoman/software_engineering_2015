require 'csv'

folder1 = ARGV[0]
folder2 = ARGV[1]

checked_files1 = []

CSV.open("result.csv", "w") do |csv|

	Dir.glob(ARGV[0] + "*").each do |filename|
   		name = filename.split("/").last.split("_")
   		if name[0].size == 5 && name.size == 3
     			checked_files1 << name
   		end
  	end
  	
  	Dir.glob(ARGV[1] + "*").each do |filename|
   		name = filename.split("/").last.split("_")
   			if name[0].size == 5 && checked_files1.include?(name) && name.size == 3
       				csv << [name[1], name[0]]
     			end
   	end
end

my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| a[0] <=> b[0] }
  
CSV.open("result.csv", "w") do |csv|
	my_csv.each {|element| csv << element}
end