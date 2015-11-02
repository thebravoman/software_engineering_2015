require 'csv'
folder1 = ARGV[0];
folder2 = ARGV[1];
if ARGV.size == 2
	arr = Array.new 
	arrmatching = Array.new
	Dir.glob(folder1+"*").each do |file|
		arr << file.split('/').last
	end
	Dir.glob(folder2+"*").each do |filenamefolder2|
		match = false
		if !arr.include? filenamefolder2.split('/').last
			names = filenamefolder2.split('/').last.split('_')
			fname = names[0]
			lname = names[1]
			arrmatching.push([fname, lname])
		end

	end

	arrmatching.sort! 

	CSV.open("result.csv", "w") do |csv|
		  arrmatching.each {|element| csv << element.reverse}
	end
end
