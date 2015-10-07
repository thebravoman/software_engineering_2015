require 'csv'

CSV.open("result.csv", "w") do |csv_array|
	Dir.glob(ARGV[0]+"*").each do |filename|
		name = filename.split("/").last.split("_")
		p "#{name[0]}, #{name[1]},#{name[2]},#{name[3].split(".").first}"
		result `ruby #{filename} "Create a program for counting words in a text file. Use method split. The name of the file is passed as first command line argument."`
	
		solved = 0
		if result.strip=="a,2\nfile,2\nthe,2\nargument,1\nas,1\ncommand,1\ncounting,1\ncreate,1\nfirst,1\nfor,1\nin,1\nis,1\nline,1\nmethod,1\nname,1\nof,1\npassed,1\nprogram,1\nsplit,1\ntext,1\nuse,1\nwords,1\n"
			solved = 1
		end
		csv_array << [name[0],name[1],name[2],name[3].split(".").first,solved]
	end	
end

my_csv = CSV.read 'result.csv'
	my_csv.sort! od |a, b|
			(a[0] == b[0]) ? (a[1].to_i <=> b[1].to_i) : (a[0] <=> b[0])
	end

	CSV.open("result.csv","w") do |csv_array|
		my_csv.each do |row|
			csv_array << row
		end
	end