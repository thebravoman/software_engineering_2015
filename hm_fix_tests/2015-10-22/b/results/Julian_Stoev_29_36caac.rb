require 'csv'

def names filename
	filename.split("/").last.split(".")
end

csv_array = []

Dir.glob(ARGV[0]+"*").each do |filename|
	names filename
	if filename[0].match(/^[a-zA-Z]+?/) and my_csv.!include? [filename]
		fsize = (filename.length) / 2
		csv_array << [filename,fsize]	
	end
end
Dir.glob(ARGV[1]+"*").each do |filename|
	names filename
	if filename[0].match(/^[a-zA-Z]+?/) and my_csv.!include? [filename]
		fsize = (filename.length) / 2
		csv_array << [filename,fsize]	
	end
end
	
csv_array.sort! { |a, b| b[1] <=> a[1] }
	
CSV.open("result.csv", "w") do |csv|
	csv_array.each {|element| csv << element}
end		
