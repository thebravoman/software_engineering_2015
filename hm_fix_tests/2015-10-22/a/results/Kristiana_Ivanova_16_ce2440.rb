require 'csv'

chekedFiels = []
folder1 = ARGV[0]
folder2 = ARGV[1]

CSV.open("result.csv", "w") do |csv|
  Dir.glob(ARGV[0]+"*").each do |filename|
  	
    name = filename.split("/").last.split("_")
    fullName = filename.split("/").last
    sum = fullName.lenth
    
    if name.size !=3
    #lenght = name.size
      csv << [fullName, fullName.lenght]
      checkedFiels << fullName + sum.to_s
    end
  end
 #end
#CSV.open("result.csv", "w") do |csv|
  Dir.glob(ARGV[1] + "*").each do |filename|
  	
	name = filename.split("/").last.split("_")
    	fullName = filename.split("/").last
	sum = fullname.length.to_s
    	if name.size != 3 && !checkedFiles.include?(fullName + sum)
    	csv << [fullName, fullName.lenght]
     	end
    end
end
 
my_csv = CSV.read 'result.csv'

my_csv.uniq
my_csv.sort_by! {|a, b| b[1] <=> a[1]}
my_csv.reverse
my_csv.sort_by{|fullName,length| fullName.downcase}
CSV.open("result.csv", "w") do |csv_array|
	my_csv.each do |row|
		csv_array << row 
		end
end

