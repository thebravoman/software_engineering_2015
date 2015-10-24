require 'csv'

folder1 = ARGV[0]
folder2 = ARGV[1]

num = [/"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"/]

CSV.open("result.csv", "w") { |csv_array|
	Dir.glob(folder1 + "*").each { |filename|
		name = filename.split("/").last.split(".")
		file = name[0]
		ext = name[1]
		
		numc = file.count num
		
		flen = name.length() / 2
		
		if numc == 7
			csv_array << [name[0],name[1],flen]
		end
	}
}

CSV.open("result.csv", "w") { |csv_array|
	Dir.glob(folder2 + "*").each { |filename|
		name = filename.split("/").last.split(".")
		file = name[0]
		ext = name[1]
		
		numc = file.count num
		
		flen = name.length() / 2
		
		if numc == 7 
			csv_array << [name[0],name[1],flen]
		end
	}
}

csv_f = CSV.read 'result.csv'

csv_f.sort! { |x, y| y[1] <=> x[1]}

CSV.open("result.csv","w") { |csv_array|
	csv_f.each { |row|
		csv_array << row
	}
}
