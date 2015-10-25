require 'csv'
folder = ARGV[0]

files = []

Dir.glob(folder+"*").each do |filename|
	name = filename.split("/").last.split("_")
	if name.size == 3 
		if name[2].split(".").last == 'rb'
			if name[1].length == 5
				files << name 
			end
		end 
	end
end

files.sort! {|a,b| a[1].downcase <=> b[1].downcase }
CSV.open("result.csv","w") do |csv|
	files.each do |line|
		csv << [line[0] , line[1]]
	end
end

