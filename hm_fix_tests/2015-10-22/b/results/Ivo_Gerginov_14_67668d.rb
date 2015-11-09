require 'csv'

folder1 = ARGV[0]
folder2 = ARGV[1]
CSV.open("result.csv", "w") do |csv|
	Dir.glob(ARGV[0]+"*").each do |folder2|
		name2 = folder2.split("/").last.split("_")
			if name2.size == 3
				fname2 = name2[0]
				lname2 = name2[1]
				number2= name2[2].split(".").first
			end
			Dir.glob(ARGV[0]+"*").each do |folder1|
				name1 = folder1.split("/").last.split("_")
				if name1.size == 3
					fname1 = name1[0]
					lname1 = name1[1]
					number1= name1[2].split(".").first
				end
				if name2[0]!=name1[0] && name2[1] != name1[1]
					csv << [name2[0],name2[1]]
				end
		end
end

my_csv = CSV.read 'result.csv'

my_csv.sort! { |a,b| [a[0],a[1].to_i] <=> [b[0],b[1].to_i] }
CSV.open("result.csv", "w") do |csv|
    my_csv.each {|element| csv << element}
end
end