require 'csv'
folder1 = ARGV[0]
folder2 = ARGV[1]

Dir.glob(ARGV[0] + "*").each do | filename|
	name = filename.split("/").last.split("_") 
		if name.size == 3 
		if name[0].size == 5 
			arr << name 
		end 
		end
	end

Dir.glob(ARGV[1] + "*").each do | filename|
name = filename.split("/").last.split("_") 
	if name.size == 3 
	if name[0].size == 5 
		arr << name 
	end 
	end
end

arr.sort!{|a,b| a[1] <=> b[1]}
CSV.open('result.csv', 'wb') do |csv|
arr.each { |line| csv << line }

end




