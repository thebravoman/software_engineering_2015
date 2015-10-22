require 'csv'

folder1 = ARGV[0]
folder2 = ARGV[1]

def names filename
	filename.split("/").last.split(".")
end

csv_array = []

	Dir.glob(ARGV[0]+"*").each do |filename|
		names filename
		if filename.first.match(/^[a-zA-Z0-9_\-+ ]*$/) and my_csv.include? [filename]
			fsize = (filename.length) / 2
			csv_array << [filename,fsize]	
		end
	end
	Dir.glob(ARGV[0]+"*").each do |filename|
		names filename
		if filename.first.match(/^[a-zA-Z0-9_\-+ ]*$/) and my_csv.include? [filename]
			fsize = (filename.length) / 2
			csv_array << [filename,fsize]	
		end
	end
	
	my_csv.sort! { |a, b| b[1] <=> a[1] }
	
	CSV.open("result.csv", "w") do |csv|
	  my_csv.each {|element| csv << element}
	end
		
