Dir.glob(ARGV[0]+"*").each do |filename|
	name = filename.split("/").last.split("_")
	p "#{name[0]},#{name[1]},#{name[2]},#{name[3].split(".").first}"
	result= `ruby #{filename} 1 3 2`
	p result
	if result=="-1.0,-2.0\n"
		p 1
	else
		p 0
	end
end
