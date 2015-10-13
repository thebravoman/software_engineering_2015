require 'csv' 

File.open("test.txt", "w") do |file|
	file.puts "Will you count the words of my word counting program "
end

CSV.open("result.csv","w") do |csv| 
	Dir.glob(ARGV[0]+"*").each do |filename| 
		name = filename.split("\\").last.split("_") 
		p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}" 
		result= `ruby #{filename} test.txt ` 
		solved = 0 
		if result=="Will,1\nyou,1\ncount,1\nthe,1\nwords,1\nof,1\nmy,1\nword,1\ncounting,1\nprogram,1\n" 
		solved = 1 
		end 
		csv << [name[0],name[1],name[2],name[3].split(".").first,solved] 
		end 
	end 
my_csv = CSV.read 'result.csv'
my_csv.sort! { |a,b| a[0] <=> b[0] } 
CSV.open("result.csv", "w") do |csv| 
	my_csv.each {|element| csv << element} 
end
