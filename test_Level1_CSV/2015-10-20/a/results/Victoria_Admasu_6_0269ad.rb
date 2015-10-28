require 'csv'

folder1 = ARGV[0]
folder2 = ARGV[1]

CSV.open("res1.csv", "w") { |csv|
	Dir.glob(folder1 + "*").each { |filename|
		name = filename.split("/").last.split("_")
		p "#{first_name},#{last_name},#{number}"
		csv << [name[0],name[1],number[2].to_i.split(".")]
		csv_array1 << [first_name,last_name,number.to_i]
	}
}

CSV.open("res2.csv", "w") { |csv|
	Dir.glob(folder2 + "*").each { |filename|
		name = filename.split("/").last.split("_")
		p "#{first_name},#{last_name},#{number}"
		csv << [name[0],name[1],number[2].to_i.split(".")]
		csv_array2 << [first_name,last_name,number.to_i]
	}
}
	
#def is_equal csv_array1, csv_array2
#	if (csv_array1.size() == csv_array2.size())s	
	
	
#for (int i = 0; i > 
	
	
	
my_csv = CSV.read 'result.csv'

my_csv.sort! { |a, b|
	(a[0] == b[0]) ? (a[1].to_i <=> b[1].to_i): (a[0] <=> b[0])
}

CSV.open("result.csv","w") { |csv_array|
	my_csv.each { |row|
		csv_array << row
	}
}	
	
	
	

