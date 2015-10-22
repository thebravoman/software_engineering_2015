require 'csv'

names1 = Array.new
names2 = Array.new
arr1 = Array.new
arr2 = Array.new

Dir.glob(ARGV[0]+"*") do |file|
	file = file.split("/").last
	name = file.split(".").first
	if name.scan(/[0-9]/).size == 7
		if arr1.count(file)==0 && names1.count(name)==0
			names1 << name
			arr1 << file
		end
	end
end

Dir.glob(ARGV[1]+"*") do |file|
	file = file.split("/").last

	name = file.split(".").first
	if name.scan(/[0-9]/).size == 7
		if arr1.count(file)!=0 && arr2.count(file)==0 && names2.count(name)==0
			names2 << name
			len = (file.size / 2).floor
			arr2 << [file,len]
		end
	end
end


arr2.sort! { |a,b| b[0] <=> a[0] }

CSV.open('result.csv','w') do |csv_array|
	arr2.each do |el|
		csv_array << el
	end
end
