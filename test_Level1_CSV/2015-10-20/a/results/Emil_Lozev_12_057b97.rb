require 'csv'

folder1 = ARGV[0]
folder2 = ARGV[1]

def only_in_first n1,n2

array = []
	n1.each do |n1filename|
		n2.each do |n2filename|
			if (n1filename[0] != n2filename[0]) && (n1filename[1] != n2filename[1])
				array << n1filename
			end
		end
	end
	array.sort!{|a,b|b[1] <=> a[1]}
	write_csv array
end

def write_csv arr
	CSV.open("result.csv","w") do |csv_array|
		arr.each do |line|
			csv_array << line
		end
	end
end

name1 = []
name2 = []
Dir.glob(folder1 + '*').each do |filename1|
	name1 = filename1.split("/").last.split("_")
	name1 = name1[2].split(".").first
end


Dir.glob(folder2 + '*').each do |filename2|
	name2 = filename2.split("/").last.split("_").split(".").first
	name2 = name2[2].split(".").first
end

only_in_first name1, name2
