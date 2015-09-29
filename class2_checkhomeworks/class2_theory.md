#Traver directory
Dir.glob("*").each do |file|
	p file
end

#Split names
Dir.glob(ARGV[0]+"*").each do |file|
	#~ p file
	result = file.split("/").last.split("_")
	p "#{result[0]},#{result[1]},#{result[2]},#{result[3]}"
end

# check homeworks
Dir.glob(ARGV[0]+"*").each do |file|
	#~ p file
	result = file.split("/").last.split("_")
	p "#{result[0]},#{result[1]},#{result[2]},#{result[3].split(".").first}"
	p `ruby #{file} 1 3 2`
end

# homeworks
1. Improve the class1_hm programs to output in the correct format. Commit a new version

2. Create a program for counting words in a file. Use method split

23:
